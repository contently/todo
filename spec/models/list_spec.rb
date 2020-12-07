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

  describe 'associations' do
    it 'has many tasks' do
      list = create(:list)
      task_1 = create(:task, list: list, user: list.user)
      task_2 = create(:task, list: list, user: list.user)

      expect(list.tasks).to match_array([task_1, task_2])
    end
  end

  describe 'destructive ActiveRecord callbacks' do
    it 'nukes all tasks when the list is nuked' do
      list = create(:list)
      task_1 = create(:task, list: list, user: list.user)

      list.destroy

      expect do
        task_1.reload
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
