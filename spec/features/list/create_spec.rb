# frozen_string_literal: true

require 'rails_helper'

feature 'Creating a task' do
  scenario 'success of creating list' do
    visit lists_path
    click_on 'New List'
    expect(page).to have_content('New list')

    fill_in 'Name', with: 'list1'
    click_button 'Save'

    expect(page).to have_content('List was successfully created.')
    visit lists_path
    expect(page).to have_content('list1')
  end



end
