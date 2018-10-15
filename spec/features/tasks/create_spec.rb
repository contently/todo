# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a task' do
  create_full_test_case
  scenario 'redirects to the tasks index page on success' do
    path = "/lists/#{list.id}/tasks/new"
    sign_in_and_visit(owner, path)

    expect(page).to have_content('Create a task')

    submit_field_with('Name', 'Test my app')

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app')
  end

  scenario 'displays an error when no name is provided' do
    path = "/lists/#{list.id}/tasks/new"
    sign_in_and_visit(owner, path)

    expect(page).to have_content('Create a task')

    submit_field_with('Name', '')

    expect(page).to have_content("Name can't be blank")
  end
end
