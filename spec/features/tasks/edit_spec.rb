require 'rails_helper'
include TasksSpecSupport

feature "Editing a task" do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  let!(:task) { Task.create(name: "Test my app", completed: false, list_id: list.id) }

  before do
    login_as user
  end

  scenario "redirects to the tasks index page on success" do
    visit list_tasks_path(list.id)
    click_on "Edit this task"
    expect(page).to have_content("Editing task")

    fill_in_form('Name', 'Test my app (updated)', 'Save')

    expect(page).to have_content("Tasks")
    expect(page).to have_content("Test my app (updated)")
  end

  scenario "displays an error when no name is provided" do
    visit edit_list_task_path(list_id: task.list_id, id: task.id)
    fill_in_form('Name', '', 'Save')

    expect(page).to have_content("Name can't be blank")
  end

  scenario "lets the user complete a task" do
    visit edit_list_task_path(task.list_id, task.id)
    check "Completed"
    click_button "Save"

    visit list_task_path(task.list_id, task)
    expect(page).to have_content("true")
  end
end
