class Task < ActiveRecord::Base
  before_save :set_completed_field_to_false_for_new_records

  validates :name, presence: true

  belongs_to :list

  scope :completed_tasks, -> { where completed: true }
  scope :incompleted_tasks, -> { where completed: false }

  def set_completed_field_to_false_for_new_records
    self.completed = false if self.new_record?
  end
end
