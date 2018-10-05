# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :completed, on: :create, acceptance: { accept: false, message: 'Task cannot be marked as completed when created.' }

  scope :completed, -> { where(completed: true) }
  scope :incompleted, -> { where(completed: false) }

  def self.get_tasks(task_type)
    if task_type == "completed"
      return self.completed
    elsif task_type == "incompleted"
      return self.incompleted
    elsif task_type == "all"
      return self.all
    end
    []  #In case task_type is none of above.
  end
end
