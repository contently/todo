# HW4: added lists tests
require 'rails_helper'

feature "Creating a list" do
  # HW5: all paths are now locked down to logged in users only, so...
  before(:context) do
    User.create(id:999, name:"tester")
  end

  before(:each) do
    visit users_path
    click_on "Login"
  end

  scenario "jumps straight to list/:id/tasks on success" do
    new_list_name = "New List"
    visit lists_path
    click_on "New List"
    expect(page).to have_content("New list")

    fill_in "Name", with: new_list_name
    click_button "Save"

    expect(page).to have_content(new_list_name)
    expect(page).to have_content('Add a task')
  end

  scenario "displays an error when no name is provided" do
    visit new_list_path
    fill_in "Name", with: ""
    click_button "Save"

    expect(page).to have_content("Name can't be blank")
  end

end
