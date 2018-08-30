require 'rails_helper'

feature "Creating a task" do
  let!(:user) { create(:user                  ) }
  let!(:list) { create(:list, user_id: user.id) }

  before do
    sign_in user
    visit list_path(list)
    click_on "Add a task"
  end

  scenario "redirects to the list page on success" do
    expect(page).to have_content("Create a task")

    fill_in "Name", with: "Test my app"
    click_button "Save"

    expect(page).to have_content("Test List")
    expect(page).to have_content("Test my app")
  end

  scenario "does not display the completed checkbox" do
    expect(page).to_not have_selector("#task_completed")
  end

  scenario "displays an error when no name is provided" do
    no_name_error
  end

  scenario "adds a new task change to task audit log and app audit log" do
    fill_in "Name", with: "Test my app"
    click_button "Save"

    click_link "Test my app"
    expect(page).to have_content("Created")

    click_link "Audit Log"
    expect(page).to have_content("Created")
  end
end
