# frozen_string_literal: true

require 'rails_helper'

feature 'Displaying tasks', js: true do
  let(:user) { create(:user) } 
  let!(:completed) { create(:task, :completed, user: user) }
  let!(:incomplete) { create(:task, :incomplete, user: user) }

  context 'when authenticated' do
    before do
      login_as user
      visit tasks_path
    end

    scenario 'by default' do
      expect(page).not_to have_content(completed.name)
      expect(page).to have_content(incomplete.name)
    end

    scenario 'by completed' do
      select 'completed', from: 'completed'

      expect(page).to have_content(completed.name)
      expect(page).not_to have_content(incomplete.name)
    end

    scenario 'by incomplete' do
      select 'incomplete', from: 'completed'

      expect(page).not_to have_content(completed.name)
      expect(page).to have_content(incomplete.name)
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to login page' do
      visit tasks_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
