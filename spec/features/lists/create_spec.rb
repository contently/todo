# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a list' do
  let(:name) { 'Khalia\'s Home Work' }
  let(:user) { create(:user) }

  context 'when authenticated' do
    before { login_as user }

    scenario 'redirects to the list page on success' do
      visit lists_path
      click_on 'New List'
      expect(page).to have_content('New list')

      fill_in 'Name', with: name
      click_button 'Save'

      expect(page).to have_content('Tasks')
      expect(page).to have_content(name)
    end

    scenario 'displays an error when no name is provided' do
      visit new_list_path
      fill_in 'Name', with: ''
      click_button 'Save'

      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to login page' do
      visit new_list_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
