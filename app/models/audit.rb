class Audit < ApplicationRecord
  belongs_to :auditable, polymorphic: true
  belongs_to :user

  scope :completed_tasks, lambda {
                            joins("INNER JOIN tasks on auditable_type = 'Task' \
                              AND auditable_id = tasks.id")
                              .where('tasks.completed = ?', true)
                          }
end
