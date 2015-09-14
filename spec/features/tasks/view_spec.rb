require 'rails_helper'

feature "Viewing a task" do

  let!(:task) { Task.create(name: "My Task", completed: false) }

  scenario "A user viewing a task should see a history of all its changes" do
    visit "/tasks"
    click_on "Edit"

    check "Completed"
    click_button "Save"
    click_link "Show"

    expect(page).to have_content("History")
    expect(page).to have_content("Completed changed from false to true")
  end


  # date, model_type, model_id, changed_attribute, changed_from, changed_to

  # scenario "displays an error when no name is provided" do
  #   visit "/tasks"
  #   click_on "Add a task"
  #   expect(page).to have_content("Create a task")

  #   fill_in "Name", with: ""
  #   click_button "Save"

  #   expect(page).to have_content("Name can't be blank")
  # end
end
