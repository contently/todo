# frozen_string_literal: true

require 'rails_helper'

feature 'Viewing a task' do
  let!(:task) { create(:task, user: user) }
  let(:user) { create(:user) }

  context 'when authenticated' do
    before { login_as user }

    scenario 'displays the audit log' do
      task.update(name: 'Take Milo to the vet')
      visit task_path(task)
      expect(page).to have_selector('.audit-item', count: 1)
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to login page' do
      visit task_path(task)
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
