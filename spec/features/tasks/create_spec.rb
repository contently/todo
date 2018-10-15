# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a task' do

  let!(:owner) { User.create!( username: "owner", password: "password" ) }

  let!(:not_owner) { User.create!( username: "not_owner", password: "password" ) }

  let!(:list) { List.create!( name: "list", user_id: owner.id, description: "list desc" ) }

  let!(:task) { Task.create( name: 'Test my app', completed: false) }

  scenario 'redirects to the tasks index page on success' do
    sign_in(owner)
    visit '/lists/' + list.id.to_s + '/tasks'
    click_on 'Add a task'
    expect(page).to have_content('Create a task')

    fill_in 'Name', with: 'Test my app'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app')
  end

  scenario 'displays an error when no name is provided' do
    sign_in(owner)
    visit '/lists/' + list.id.to_s + '/tasks'
    click_on 'Add a task'
    expect(page).to have_content('Create a task')

    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end
end
