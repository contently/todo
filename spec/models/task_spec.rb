# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  context 'with no name' do
    it 'is invalid' do
      task = Task.new
      expect(task).to_not be_valid
    end
  end

  context 'with completed attributes when creating' do
    let(:task) { build :task, completed: true }

    it 'is invalid' do
      expect(task).to_not be_valid
    end

    it 'is valid when completed is changed to false' do
      task.completed = false
      expect(task).to be_valid
    end
  end

  context '#get_tasks' do
    let(:task1) { create :task }
    let(:task2) { create :task }

    before(:each) do
      task1.completed = true
      task1.save
    end

    it 'should return completed tasks when task_type is completed' do
      expect(Task.get_tasks("completed")).to eq([task1])
    end

    it 'should return incompleted tasks when task_type is incompleted' do
      expect(Task.get_tasks("incompleted")).to eq([task2])
    end

    it 'should return all tasks when task_type is all' do
      expect(Task.get_tasks("all")).to eq([task1, task2])
    end

    it 'should return empty array when task_type is any other type' do
      expect(Task.get_tasks("whatothers")).to eq([])
    end
  end
end
