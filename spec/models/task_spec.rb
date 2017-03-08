require 'rails_helper'

describe Task, type: :model do
  # HW4: now all tasks need a list
  let!(:list) { List.new(name: "Test List") }

  # HW1: sanity check if everything's working
  context "has a name and list" do
    it "is valid" do
      task = Task.new(name:"passing task", list:list)
      expect(task).to be_valid
    end
  end

  context "with no name" do
    it "is invalid" do
      task = Task.new(list:list)
      expect(task).to_not be_valid
    end
  end

  # HW1: Don't allow setting completed to true on creation
  context "is completed on creation" do
    it "is invalid" do
      task = Task.new(name:"precompleted task", completed:true, list:list)
      expect(task).to_not be_valid
    end
  end

  # HW4: Make sure tasks are associated to lists
  context "without a list" do
    it "is invalid" do
      task = Task.new(name:"orphan task")
      expect(task).to_not be_valid
    end
  end

end
