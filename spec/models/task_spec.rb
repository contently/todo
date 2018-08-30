require 'rails_helper'

describe Task, type: :model do
  context "with no name" do
    it "is invalid" do
      task = Task.new
      expect(task).to_not be_valid
    end
  end

  context "associations" do
    it { should belong_to(:list        ) }
    it { should have_many(:task_changes) }
  end

  describe ".completed_filter" do
    let!(:list) { create(:list) }
    let!(:completed_task) {create(:task, name: "Completed Task", completed: true )}
    let!(:incomplete_task) {create(:task, name: "Incomplete Task", completed: false)}

    it "filters tasks by completed if filter is present and returns filter and tasks" do
      expect(Task.completed_filter("Completed", Task.all)).to eq(["Completed", [completed_task]])
    end

    it "defaults to returning incomplete tasks if no filter is present" do
      expect(Task.completed_filter(nil, Task.all)).to eq(["Incomplete", [incomplete_task]])
    end
  end

  describe "#log_creation_change" do
    let!(:list) { create(:list) }
    it "creates a task change after a task is created" do
      expect{Task.create(name: "Test task", completed: false, list_id: list.id)}.to change{TaskChange.count}.by(1)

      expect(TaskChange.last.action).to eq("Created")
    end
  end

  describe "#log_update_change" do
    let!(:list) { create(:list                  ) }
    let!(:task) { create(:task, list_id: list.id) }
    it "creates a task change after a task is updated" do
      expect{task.update(name: "Test task (updated)")}.to change{TaskChange.count}.by(1)

      expect(TaskChange.last.action).to eq("Name changed from Test Task to Test task (updated)")
    end

    it "creates a task change with a completed action" do
      task.update(completed: true)

      expect(TaskChange.last.action).to eq("Completed")
    end
  end
end
