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
  end
end
