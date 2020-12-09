require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with no email' do
    it 'is invalid' do
      task = User.new
      expect(task).to_not be_valid
    end
  end
end
