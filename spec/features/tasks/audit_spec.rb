# frozen_string_literal: true

require 'rails_helper'

feature 'Creating and editing a task' do
  scenario 'audit is empty when no changes' do
    visit tasks_path
    click_on 'Add a task'

    fill_in 'Name', with: 'Test my app'
    click_button 'Save'

    click_link 'Show'
    expect(page).to have_content 'Test my app'
    expect(page).not_to have_content 'Change history'
  end

  scenario 'audit is present after changes' do
    visit tasks_path
    click_on 'Add a task'

    fill_in 'Name', with: 'First name'
    click_button 'Save'

    click_link 'Edit'
    fill_in 'Name', with: 'Revised name'
    click_button 'Save'

    click_link 'Show'

    expect(page).to have_content 'First name'
    expect(page).to have_content 'Revised name'
    expect(page).to have_content 'Change history'
  end
end
