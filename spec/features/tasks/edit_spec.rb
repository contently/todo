# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do

  scenario 'redirects to the tasks index page on success' do
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

    click_on 'Edit'
    expect(page).to have_content('Editing task')

    fill_in 'Name', with: 'Test my app (updated)'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
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

  scenario 'lets the user complete a task' do
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

    click_on 'Edit'
    expect(page).to have_content('Editing task')

    check 'Completed'
    click_button 'Save'

    expect(page).to have_content("Today's list")
    check 'Show completed tasks'
  end
end
