# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a task' do
  scenario 'redirects to the tasks index page on success' do
    visit tasks_path
    click_on 'Add a task'
    expect(page).to have_content('Create a task')

    fill_name_and_save("Test my app")

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app')
  end

  scenario 'displays an error when no name is provided' do
    visit new_task_path
    fill_name_and_save("")

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'displays an error when task is marked as completed when creating it' do
    visit new_task_path
    fill_in 'Name', with: 'Task1'
    check 'Completed'
    click_button 'Save'

    expect(page).to have_content("Task cannot be marked as completed when created")
  end

  scenario 'displays successful message when task is not marked as completed when creating it' do
    visit new_task_path
    fill_in 'Name', with: 'Task1'
    uncheck 'Completed'
    click_button 'Save'

    expect(page).to have_content("Task was successfully created")
  end
end
