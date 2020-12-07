# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do
  before(:each) do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  let!(:list) { List.create(user: @user, name: 'some list') }
  let!(:task) { Task.create(name: 'Test my app', completed: false, user: @user, list: list) }

  scenario 'redirects to the tasks index page on success' do
    visit list_tasks_path(list_id: list.id)
    click_on 'Edit'
    expect(page).to have_content('Editing task')

    fill_in 'Name', with: 'Test my app (updated)'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
  end

  scenario 'displays an error when no name is provided' do
    visit edit_list_task_path(list_id: list.id, id: task.id)
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'lets the user complete a task' do
    visit edit_list_task_path(list_id: list.id, id: task.id)
    check 'Completed'
    click_button 'Save'

    visit list_task_path(list_id: task.list.id, id: task.id)
    expect(page).to have_content('Yes')
  end
end
