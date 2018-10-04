# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :completed, on: :create, acceptance: { accept: false, message: 'Task cannot be marked as completed when created.' }

  def self.get_list(completed_param)
    tasks = []
    if completed_param == "completed"
      tasks = self.where(completed: true)
    elsif completed_param == "incompleted"
      tasks = self.where(completed: false)
    elsif completed_param == "all"
      tasks = self.all
    end
    tasks
  end
end
