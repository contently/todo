# frozen_string_literal: true

require 'rails_helper'

feature 'Complete a task' do

  let(:user) { create :user }
  let!(:task) { create :task, user: user }

  before(:each) do
    login_as user
  end

  scenario 'Clicks and completes task' do

    visit tasks_path
    expect(page).to have_content( task.name )
    click_on 'Complete'
    expect(page).to_not have_content( task.name )
    expect(page).to have_content('Tasks')
  end

end
