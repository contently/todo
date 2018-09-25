class Task < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :list

  scope :completed_tasks, -> { where completed: true }
  scope :incompleted_tasks, -> { where completed: false }
end
