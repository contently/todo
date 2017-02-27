require 'rails_helper'

RSpec.describe List, type: :model do
  context 'new list' do
    it 'can be created' do
      list = create(:list)
      expect(list.save).to eq true
    end
  end

  context "with no name" do
    it "is invalid" do
      list = List.new
      expect(list).to_not be_valid
    end
  end
end
