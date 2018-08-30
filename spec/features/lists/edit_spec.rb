require 'rails_helper'

feature "Editing a list" do
  let!(:user) { create(:user                  ) }
  let!(:list) { create(:list, user_id: user.id) }

  before do
    sign_in user
  end

  scenario "redirects to the list page on success" do
    visit list_path(list)
    click_on "Edit"
    expect(page).to have_content("Editing task list")

    fill_in "Name", with: "Test list (updated)"
    click_button "Save"

    expect(page).to have_content("Test list (updated)")
  end

  scenario "displays an error when no name is provided" do
    visit edit_list_path(list)
    no_name_error
  end

end
