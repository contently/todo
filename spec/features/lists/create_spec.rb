require 'rails_helper'

feature "Creating a list" do
  let(:user) { create(:user) }

  before do
    login_as user
    visit new_list_path
  end

  scenario "redirects to the lists index page on success" do
    fill_in "Title", with: "Test list"
    click_button "Save"

    expect(page).to have_content("Lists")
    expect(page).to have_content("Test list")
  end

  scenario "displays an error when no name is provided" do
    fill_in "Title", with: ""
    click_button "Save"

    expect(page).to have_content("Title can't be blank")
  end
end
