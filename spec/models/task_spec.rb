# frozen_string_literal: true

require 'rails_helper'

describe Task, type: :model do
  let(:task) { build(:task) }

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
end
