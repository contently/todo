# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do
  let(:user) { create(:user) }
  let!(:task) { create(:task, user: user, name: 'Test my app', completed: false) }

  context 'when logged in' do
    before { login_as user }

    scenario 'redirects to the tasks index page on success' do
      visit tasks_path
      click_on 'Edit'
      expect(page).to have_content('Editing task')

      fill_in 'Name', with: 'Test my app (updated)'
      click_button 'Save'

      expect(page).to have_content('Tasks')
      expect(page).to have_content('Test my app (updated)')
    end

    scenario 'displays an error when no name is provided' do
      visit edit_task_path(task)
      fill_in 'Name', with: ''
      click_button 'Save'

      expect(page).to have_content("Name can't be blank")
    end

    scenario 'lets the user complete a task' do
      visit edit_task_path(task)
      check 'Completed'
      click_button 'Save'

      visit task_path(task)
      expect(page).to have_content('true')
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to login page' do
      visit edit_task_path(task)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
