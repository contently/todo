require 'rails_helper'

describe Task, type: :model do
  let(:task) { create(:task) }

  context 'new task' do
    it 'can be created' do
      expect(task.save).to eq true
    end

    it 'default completed value is false' do
      expect(task.completed).to eq false
    end

    context "with no name" do
      it "is invalid" do
        task = Task.new
        expect(task).to_not be_valid
      end
    end
  end

  context "filter by status" do
    before do
      create(:task)
      create(:task)
      create(:task, completed: true)
    end

    it "returns incomplete tasks by default" do
      expect(Task.filter_on_completed.size).to eq 2
    end

    it "returns completed tasks when given 'completed'" do
      expect(Task.filter_on_completed('completed').size).to eq 1
    end

    it "returns incomplete tasks for invalid value" do
      expect(Task.filter_on_completed('done').size).to eq 2
    end
  end

  context 'audit versions' do
    it 'initialized at 0' do
      expect(Task.new.versions.size).to eq 0
    end

    it 'start at 1 after creation' do
      expect(task.versions.size).to eq 1
      expect(task.versions.last.event).to eq 'create'
    end

    it 'creates new version when updating name' do
      task.update_attribute(:name, 'new name')
      expect(task.versions.last.event).to eq 'update'
      expect(task.name).to eq 'new name'
    end

    it 'creates new version when updating completed' do
      task.update_attribute(:completed, true)
      expect(task.versions.last.event).to eq 'update'
      expect(task.completed).to eq true
    end

  end
end
