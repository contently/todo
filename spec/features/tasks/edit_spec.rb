# frozen_string_literal: true

require 'rails_helper'

feature 'Editing a task' do
  let!(:owner) { User.create!( username: "owner", password: "password" ) }

  let!(:not_owner) { User.create!( username: "not_owner", password: "password" ) }

  let!(:list) { List.create!( name: "list", user_id: owner.id, description: "list desc" ) }

  let!(:task) { Task.create( name: 'Test my app', completed: false, list_id: list.id) }

  scenario 'redirects to the tasks index page on success' do
    sign_in(owner)
    visit '/lists/' + list.id.to_s + '/tasks'
    click_on 'Edit'
    expect(page).to have_content('Editing task')

    fill_in 'Name', with: 'Test my app (updated)'
    click_button 'Save'

    expect(page).to have_content('Tasks')
    expect(page).to have_content('Test my app (updated)')
  end

  scenario 'displays an error when no name is provided' do
    sign_in(owner)
    visit '/lists/' + list.id.to_s + '/tasks/' + task.id.to_s + '/edit'
    fill_in 'Name', with: ''
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'lets the user complete a task' do
    sign_in(owner)
    visit '/lists/' + list.id.to_s + '/tasks/' + task.id.to_s + '/edit'
    check 'Completed'
    click_button 'Save'

    visit '/lists/' + list.id.to_s + '/tasks/' + task.id.to_s
    expect(page).to have_content('true')
  end
end
