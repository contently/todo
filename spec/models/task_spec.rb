# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  let(:task) { build(:task) }

  it { expect(task).to respond_to(:user) }
  it { expect(task).to respond_to(:list) }
  it { expect(task).to respond_to(:audits) }

  context 'with no name' do
    let(:task) { build(:task, name: nil) }

    it 'is invalid' do
      expect(task).to_not be_valid
    end
  end

  context 'with completed' do
    let(:task) { build(:task, completed: true) }

    it 'is invalid' do
      expect(task).to_not be_valid
    end
  end

  describe '.completed' do
    let!(:completed_task) { create(:task, :completed) }
    let!(:incomplete_task) { create(:task, :incomplete) }

    it { expect(Task.completed).to eq([completed_task]) }
  end

  describe '.incomplete' do
    let!(:completed_task) { create(:task, :completed) }
    let!(:incomplete_task) { create(:task, :incomplete) }

    it { expect(Task.incomplete).to eq([incomplete_task]) }
  end

  describe 'updating a task' do
    before { task.save }

    it 'creates and audit item' do
      expect { task.update(name: 'Pay Kacey\'s fees') }.to change(Audit, :count).by(1)
    end
  end
end
