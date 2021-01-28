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
end
