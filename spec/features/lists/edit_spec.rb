require 'rails_helper'

feature "Editing a list" do
  let(:user) { create(:user) }
  let!(:list) { create(:list, user: user) }

  before do
    login_as user
    visit edit_list_path(list)
  end

  scenario "redirects to the tasks index page on success" do
    fill_in "Title", with: "Test list (updated)"
    click_button "Save"

    expect(page).to have_content("Lists")
    expect(page).to have_content("Test list (updated)")
  end

  scenario "displays an error when no name is provided" do
    fill_in "Title", with: ""
    click_button "Save"

    expect(page).to have_content("Title can't be blank")
  end
end
