require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }

    it 'requires a name' do
      expect(build(:list, name: nil)).to_not be_valid
    end

    it 'requires a unique name' do
      expect(create(:list, user: user, name: 'my list')).to be_valid
      expect(build(:list, user: user, name: 'my list')).to_not be_valid
    end

    it 'requires a unique name regardless of case' do
      expect(create(:list, user: user, name: 'my list')).to be_valid
      expect(build(:list, user: user, name: 'My List')).to_not be_valid
    end

    it 'requires a unique name regardless of case scoped to a user' do
      expect(create(:list, user: user, name: 'my list')).to be_valid
      expect(build(:list, user: create(:user), name: 'My List')).to be_valid
    end
  end
end
