require 'rails_helper'

feature "Editing a task" do
  # HW5: all paths are now locked down to logged in users only, so...
  before(:each) do
    visit users_path
    click_on "Login"
  end

  # HW4: now all tasks need a list
  let!(:list) { List.create(name: "Test List", user_id:999) }
  let!(:task) { Task.create(name: "Test my app", completed: false, list:list) }

  scenario "redirects to the tasks index page on success" do
    visit list_tasks_path(list)
    click_on "Edit"
    expect(page).to have_content("Editing task")

    fill_in "Name", with: "Test my app (updated)"
    click_button "Save"  # I changed this from "Update"; out of date test?

    expect(page).to have_content("Tasks")
    expect(page).to have_content("Test my app (updated)")
  end

  scenario "displays an error when no name is provided" do
    visit edit_list_task_path(list, task)
    fill_in "Name", with: ""
    click_button "Save"

    expect(page).to have_content("Name can't be blank")
  end

  scenario "lets the user complete a task" do
    visit edit_list_task_path(list, task)
    check "Completed"
    click_button "Save"

    visit list_task_path(list, task)
    expect(page).to have_content("true")
  end

  # HW1:
  scenario "displays completed checkbox on edit" do
    visit edit_list_task_path(list, task)
    expect(page).to have_field("task[completed]")
  end
end
