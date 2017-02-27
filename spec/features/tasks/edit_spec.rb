require 'rails_helper'

feature "Editing a task" do
  let(:user) { create(:user) }
  let!(:list) { create(:list, user: user) }
  let!(:task) { Task.create(name: "Test my app", completed: false, list: list) }

  before do
    login_as user
    visit edit_list_task_path(list, task)
  end

  scenario "redirects to the tasks index page on success" do
    fill_in "Name", with: "Test my app (updated)"
    click_button "Save"

    expect(page).to have_content("Tasks")
    expect(page).to have_content("Test my app (updated)")
  end

  scenario "displays an error when no name is provided" do
    fill_in "Name", with: ""
    click_button "Save"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "lets the user complete a task" do
    check "Completed"
    click_button "Save"

    visit list_task_path(list, task)
    expect(page).to have_content("true")
  end
end
