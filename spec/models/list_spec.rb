require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { create(:list) }

  it { expect(list).to respond_to(:user) }
  it { expect(list).to respond_to(:tasks) }

  context 'with no name' do
    let(:list) { build(:list, name: nil) }

    it 'is invalid' do
      expect(list).to_not be_valid
    end
  end
end
