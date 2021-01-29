# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a list' do
  let(:user) { create(:user) }
  let(:updated_name) { 'Leiyani\'s Supplies' }
  let!(:list) { create(:list, user: user, name: 'Random List') }

  context 'when logged in' do
    before { login_as user }

    scenario 'redirects to the lists index page on success' do
      visit lists_path
      find(:css, '.link-edit').click
      expect(page).to have_content('Editing list')

      fill_in 'Name', with: updated_name
      click_button 'Save'

      expect(page).to have_content('Lists')
      expect(page).to have_content(updated_name)
    end

    scenario 'displays an error when no name is provided' do
      visit edit_list_path(list)
      fill_in 'Name', with: ''
      click_button 'Save'

      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to login page' do
      visit edit_list_path(list)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
