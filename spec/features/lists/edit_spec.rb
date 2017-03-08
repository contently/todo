# HW4: added lists tests
require 'rails_helper'

feature "Editing a list" do

  # HW5: all paths are now locked down to logged in users only, so...
  before(:each) do
    visit users_path
    click_on "Login"
  end

  let!(:list) { List.create(name: "List editing test", user_id:999)}

  scenario "jumps straight to list/:id/tasks on success" do
    visit lists_path
    expect(page).to have_content("logged in as")
    click_on "Edit"
    expect(page).to have_content("Editing list")

    updated_list_name = "Test my list (updated)"
    fill_in "Name", with: updated_list_name
    click_button "Save"

    expect(page).to have_content(updated_list_name)
    expect(page).to have_content('Add a task')
  end

  scenario "displays an error when no name is provided" do
    visit edit_list_path(list)
    fill_in "Name", with: ""
    click_button "Save"

    expect(page).to have_content("Name can't be blank")
  end


end
