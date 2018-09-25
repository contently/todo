require 'rails_helper'

feature "Creating a task" do
  scenario "redirects to the tasks index page on success" do
    visit tasks_path
    click_on "Add a task"
    expect(page).to have_content("Create a task")

    fill_in_form('Name', 'Test my app', 'Save')

    expect(page).to have_content("Tasks")
    expect(page).to have_content("Test my app")
  end

  scenario "displays an error when no name is provided" do
    visit new_task_path
    fill_in_form('Name', '', 'Save')

    expect(page).to have_content("Name can't be blank")
  end
end
