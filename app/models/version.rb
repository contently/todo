class Version < ActiveRecord::Base
  validates :description, :updated_at, :task_id, presence: true

  belongs_to :task
end
