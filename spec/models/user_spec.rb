require 'rails_helper'
begin
  User
rescue
  User = nil
end

RSpec.describe User, :type => :model do

  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(nickname: "jack_bruce", password: "abcdef")
      user = User.find_by_nickname("jack_bruce")
      expect(user.password).not_to be("abcdef")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(nickname: "jack_bruce", password: "abcdef")
    end
  end

  describe "session token" do
    it "assigns a session_token if one is not given" do
      jack = User.create(nickname: "jack_bruce", password: "abcdef")
      expect(jack.session_token).not_to be_nil
    end
  end

  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:password_digest) }
  it { should have_many(:todo_lists) }
  it { should have_many(:todo_items).through(:todo_lists) }
end
