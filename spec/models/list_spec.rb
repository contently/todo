require 'rails_helper'

RSpec.describe List, type: :model do
  context 'with no name' do
    it 'is invalid' do
      task = List.new
      expect(task).to_not be_valid
    end
  end
end
