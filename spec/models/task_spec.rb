require 'rails_helper'

describe Task, type: :model do
  context "with no name" do
    it "is invalid" do
      task = Task.new
      expect(task).to_not be_valid
    end
  end
end
