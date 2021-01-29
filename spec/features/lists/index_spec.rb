# frozen_string_literal: true

require 'rails_helper'

feature 'Displaying lists' do
  let(:user) { create(:user) }
  let!(:lists) { create_list(:list, 3, :with_tasks, user: user) }

  context 'when authenticated' do
    before do
      login_as user
      visit lists_path
    end

    scenario 'by default' do
      expect(page).to have_selector('.card', count: 3)
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to login page' do
      visit lists_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
