require 'rails_helper'

feature "Creating a task" do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }

  before do
    login_as user
    visit new_list_task_path(list)
  end

  scenario "redirects to the tasks index page on success" do
    fill_in "Name", with: "Test my app"
    click_button "Save"

    expect(page).to have_content("Tasks")
    expect(page).to have_content("Test my app")
  end

  scenario "displays an error when no name is provided" do
    fill_in "Name", with: ""
    click_button "Save"

    expect(page).to have_content("Name can't be blank")
  end
end
