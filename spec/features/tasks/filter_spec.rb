require 'rails_helper'

feature "Filtering task list" do
  let!(:user           ) { create(:user                                                             ) }
  let!(:list           ) { create(:list, user_id: user.id                                           ) }
  let!(:completed_task ) { create(:task, list_id: list.id, name: "Completed task", completed: true  ) }
  let!(:incomplete_task) { create(:task, list_id: list.id, name: "Incomplete task", completed: false) }

  before do
    sign_in user
  end

  scenario "defaults to incomplete tasks" do
    visit list_path(list)
    expect(page).to have_content('Incomplete task')
    expect(page).not_to have_content('Completed task')
  end

  scenario "displays only completed tasks when selected", js: true do
    visit list_path(list)
    expect(page).to have_content('Incomplete task')
    execute_script("document.getElementById('tasks_all').value = 'Completed'")
    execute_script("document.getElementById('tasks_all').onchange()")
    expect(page).to have_content('Completed task')
    expect(page).not_to have_content('Incomplete task')
  end
end
