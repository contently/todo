require 'rails_helper'

describe User, type: :model do
  context "with no password" do
    it "is invalid" do
      user = User.new(username: 'testUser')

      expect(user.valid?).to be(false)
      expect(user.errors.messages[:password_digest]).to include("can't be blank")
    end
  end
end
