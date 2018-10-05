module VisitHelper
  def fill_name_and_save(name)
    fill_in 'Name', with: name
    click_button 'Save'
  end

  def create_tasks_and_visit_root_path
    task1 = create(:task, name: "task1")
    create(:task, name: "task2")
    task1.completed = true
    task1.save
    visit root_path
  end
end