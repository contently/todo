# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a List' do

  let(:user) { create :user }

  before(:each) do
    login_as user
  end


  scenario 'redirects to the list index page on success' do

    visit tasks_path
    click_on 'Create List'
    expect(page).to have_content('Create a list')

    fill_in 'Name', with: 'My New List Name'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('My New List Name')
  end

  scenario 'displays an error when no name is provided' do
    visit new_list_path
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
end
