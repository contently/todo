require 'rails_helper'

feature "Editing a task" do
  let!(:user) { create(:user                                       ) }
  let!(:list) { create(:list, user_id: user.id                     ) }
  let!(:task) { create(:task, name: "Test my app", list_id: list.id) }

  before do
    sign_in user
  end

  scenario "redirects to the list show page on success" do
    visit edit_list_task_path(list, task)

    fill_in "Name", with: "Test my app (updated)"
    click_button "Save"

    expect(page).to have_content("Test List")
  end

  scenario "displays an error when no name is provided" do
    visit edit_list_task_path(list, task)
    no_name_error
  end

  scenario "lets the user complete a task" do
    visit edit_list_task_path(list, task)
    expect(page).to have_selector("#task_completed")

    check "Completed"
    click_button "Save"

    visit edit_list_task_path(list, task)
    expect(find('#task_completed')).to be_checked
  end

  scenario "adds a new task change to task audit log and app audit log" do
    visit edit_list_task_path(list, task)

    fill_in "Name", with: "Test my app (updated)"
    click_button "Save"
    click_on "Test my app (updated)"

    expect(page).to have_content("Name changed from Test my app to Test my app (updated)")

    click_on "Audit Log"
    expect(page).to have_content("Name changed from Test my app to Test my app (updated)")
  end
end
