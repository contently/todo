require 'rails_helper'

describe List, type: :model do
  # HW1: sanity check if everything's working
  context "has a name and user" do
    it "is valid" do
      list = List.new(name: "passing list", user_id: 999)
      expect(list).to be_valid
    end
  end

  context "with no name" do
    it "is invalid" do
      list = List.new(user_id:999)
      expect(list).to_not be_valid
    end
  end

  #HW4: test our association
  context "can add tasks" do
    it "has tasks" do
      list = List.new(name: "tasklist",user_id:999)
      for i in 1..3
        list.tasks << Task.new(name: "task#{i}")
      end

      expect(list.tasks.size).to eql(i)
    end
  end
end
