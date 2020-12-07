# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  context 'concerning validations' do
    it 'it requires a name' do
      task = build(:task, name: nil)
      expect(task).to_not be_valid
    end
  end

  describe 'completing a task' do
    # .new_record? - Returns true if this object hasn’t been saved yet — that is, a record for the object doesn’t exist yet; otherwise, returns false.
    it 'can be marked as incomplete when a new record' do
      task = build(:task, name: 'R-Spec Test', completed: false)
      expect(task.new_record?).to be_truthy
      task.save

      expect(task.persisted?).to be_truthy
    end

    it 'can NOT be marked as completed when it is a new record' do
      task = build(:task, name: 'R-Spec Test', completed: true)
      expect(task.new_record?).to be_truthy
      task.save

      expect(task.valid?).to be_falsey
      expect(task.errors[:completed]).to_not be_empty
      expect(task.errors[:completed]).to include("can't be set during creation!")
    end

    it 'can later complete a task which was created as non-completed' do
      task = create(:task, name: 'Get a job', completed: false)
      expect(task.completed?).to be_falsey
      task.update(completed: true)
      expect(task.completed?).to be_truthy
    end
  end

  describe 'scopes' do
    # Shared data across specs
    before(:each) do
      # And since we can't mark a task as completed during creation, we do this:
      @task_1 = build(:task, name: 'Buy Tools', completed: false)
      @task_1.save
      @task_1.update(completed: true)
      @task_2 = create(:task, name: 'Buy a 14-inch bandsaw', completed: false)
    end

    it 'knows tasks which are complete' do
      expect(Task.complete).to match_array([@task_1])
    end

    it 'knows tasks which are pending' do
      expect(Task.pending).to match_array([@task_2])
    end
  end

  describe 'relations' do
    it 'belongs to a list' do
      list = create(:list)
      task = create(:task, name: 'belong to a list', list: list)
      expect(task.list).to eql(list)
    end
  end
end
