# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires the email' do
      expect(build(:user, email: nil)).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many tasks' do
      user = create(:user)
      task_1 = create(:task, user: user)
      task_2 = create(:task, user: user)

      expect(user.tasks).to match_array([task_1, task_2])
    end

    it 'has many lists' do
      user = create(:user)
      list_1 = create(:list, user: user)
      list_2 = create(:list, user: user)

      expect(user.lists).to match_array([list_1, list_2])
    end
  end

  describe 'destructive ActiveRecord callbacks' do
    it 'nukes all tasks when the user is nuked' do
      user = create(:user)
      task_1 = create(:task, user: user)

      user.destroy

      expect do
        task_1.reload
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'nukes all lists when the user is nuked' do
      user = create(:user)
      list_1 = create(:list, user: user)

      user.destroy

      expect do
        list_1.reload
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
