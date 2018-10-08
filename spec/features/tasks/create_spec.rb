# frozen_string_literal: true
# setup the helpers
include Warden::Test::Helpers

require 'rails_helper'

feature 'Creating a task' do

  before :each do
    @user = create(:user)
    Warden.test_mode!
    login_as(@user, scope: :user)

    @list = FactoryBot.create(:list, user: @user)
    @task = FactoryBot.create(:task, list: @list, user: @user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'redirects to the tasks index page on success' do
    visit list_path(@list)
    click_on 'Add a task'
    expect(page).to have_content('Create a task')

    fill_in 'Name', with: 'Test my app'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app')
  end

  scenario 'displays an error when no name is provided' do
    visit new_list_task_path(:list_id => @list.id)
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
end
