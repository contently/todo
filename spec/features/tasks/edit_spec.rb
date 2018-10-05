# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do
  let!(:task) { create(:task, name: 'Test my app') }

  scenario 'redirects to the tasks index page on success' do
    visit tasks_path
    click_on 'Edit'
    expect(page).to have_content('Editing task')

    fill_name_and_save('Test my app (updated)')
    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
  end

  scenario 'displays an error when no name is provided' do
    visit edit_task_path(task)
    fill_name_and_save("")

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'lets the user complete a task' do
    visit edit_task_path(task)
    check 'Completed'
    click_button 'Save'

    visit task_path(task)
    expect(page).to have_content('true')
  end

  scenario 'displays completed checkbox' do
    visit edit_task_path(task)
    expect(page).to have_selector("#task_completed")
  end
end
