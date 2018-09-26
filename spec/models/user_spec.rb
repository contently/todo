require 'rails_helper'

describe User, type: :model do
  context "with no username" do
    it "is invalid" do
      user = User.new
      expect(user).to_not be_valid
    end
  end
end
