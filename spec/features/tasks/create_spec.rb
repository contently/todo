require 'rails_helper'
include TasksSpecSupport

feature "Creating a task" do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }

  before do
    login_as user
  end

  scenario "redirects to the tasks index page on success" do
    visit list_tasks_path(list.id)
    click_on "Create new task"
    expect(page).to have_content("Create a task")

    fill_in_form('Name', 'Test my app', 'Save')

    expect(page).to have_content("Tasks")
    expect(page).to have_content("Test my app")
  end

  scenario "displays an error when no name is provided" do
    visit new_list_task_path(list.id)
    fill_in_form('Name', '', 'Save')

    expect(page).to have_content("Name can't be blank")
  end
end
