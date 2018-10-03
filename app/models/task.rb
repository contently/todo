# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :completed, on: :create, acceptance: { accept: false, message: 'Task cannot be marked as completed when created.' }
end
