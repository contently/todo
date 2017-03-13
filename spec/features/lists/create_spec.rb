require 'rails_helper'

feature "Creating a list" do
  let!(:user) { create(:user) }

  before do
    sign_in user
    visit lists_path
    click_on "Add a task list"
  end

  scenario "redirects to the list page on success" do
    fill_in "Name", with: "Test list"
    click_button "Save"

    expect(page).to have_content("Test list")
    expect(page).to have_content("Add a task")
  end

  scenario "displays an error when no name is provided" do
    no_name_error
  end
end
