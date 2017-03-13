require 'rails_helper'

describe List, type: :model do
  context "with no name" do
    it "is invalid" do
      list = List.new
      expect(list).to_not be_valid
    end
  end

  context "associations" do
    it { should have_many(:tasks) }
  end
end
