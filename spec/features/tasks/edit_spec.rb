# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do
  create_full_test_case

  scenario 'redirects to the tasks index page on success' do
    path = "/lists/#{list.id}/tasks/#{task.id}/edit"
    sign_in_and_visit(owner, path)
    expect(page).to have_content('Editing task')

    fill_in 'Name', with: 'Test my app (updated)'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
  end

  scenario 'displays an error when no name is provided' do
    path = "/lists/#{list.id}/tasks/#{task.id}/edit"
    sign_in_and_visit(owner, path)
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'lets the user complete a task' do
    path = "/lists/#{list.id}/tasks/#{task.id}/edit"
    sign_in_and_visit(owner, path)
    check 'Completed'
    click_button 'Save'

    visit "/lists/#{list.id}/tasks/#{task.id}"
    expect(page).to have_content('true')
  end
end
