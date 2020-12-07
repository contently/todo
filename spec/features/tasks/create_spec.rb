# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a task' do
  before(:each) do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  let!(:list) { List.create(user: @user, name: 'create spec list') }

  scenario 'redirects to the tasks index page on success' do
    visit list_tasks_path(list_id: list.id)
    click_on 'Add a task'
    expect(page).to have_content('Create a task')

    fill_in 'Name', with: 'Test my app'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    save_and_open_page
    expect(page).to have_content('Test my app')
  end

  scenario 'displays an error when no name is provided' do
    visit new_list_task_path(list_id: list.id)
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
end
