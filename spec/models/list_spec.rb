require 'rails_helper'

RSpec.describe List, type: :model do
  context 'with no name' do
    it 'is invalid' do
      list = List.new
      expect(list).to_not be_valid
    end
  end
end
