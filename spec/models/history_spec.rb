# frozen_string_literal: true

require 'rails_helper'

describe History, type: :model do
  context 'history create error without task' do
    it 'is invalid' do
      task = History.new
      expect(task).to_not be_valid
    end
  end

  context 'history create invalid without task id' do
    it 'is invalid' do
      task = Task.new(name: "task1")
      history = History.new(name: "task1")
      expect(history).to_not be_valid
    end
  end
end
