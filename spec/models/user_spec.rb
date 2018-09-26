require 'rails_helper'

describe User, type: :model do
  context "with no password" do
    it "is invalid" do
      user = User.new(username: 'testUser')
      expect(user).to_not be_valid
    end
  end
end
