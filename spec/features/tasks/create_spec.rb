# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a task' do
  

  scenario 'creating a list redirects to the task list index page on success' do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    visit task_lists_path

    click_on 'New Task list'
    expect(page).to have_content('List name')

    fill_in 'List name', with: "Today's list"
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content("Today's list")
  end

  scenario 'redirects to the task list index page on success' do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    visit task_lists_path

    click_on 'New Task list'
    expect(page).to have_content('List name')

    fill_in 'List name', with: "Today's list"
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content("Today's list")

    expect(page).to have_content('Add a task')
    click_on 'Add a task'


    fill_in 'Name', with: 'Test my app'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app')
  end

  scenario 'displays an error when no name is provided' do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    visit task_lists_path

    click_on 'New Task list'
    expect(page).to have_content('List name')

    fill_in 'List name', with: "Today's list"
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content("Today's list")
    
    expect(page).to have_content('Add a task')
    click_on 'Add a task'

    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
  Warden.test_reset! 
end
