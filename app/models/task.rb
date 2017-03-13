class Task < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :list
  has_many :task_changes, dependent: :destroy

  before_update :log_update_change
  before_create :log_creation_change

  private

  def log_creation_change
    task_changes.build(action: "Created")
  end

  def log_update_change
    changes.each_key do |attribute|
      if attribute == 'name'
        action = "Name changed from " + changes[attribute][0] + " to " + changes[attribute][1]
      elsif attribute == "completed"
        action = "Completed"
      end
      task_changes.build(action: action) if action
    end
  end

  def self.completed_filter(filter, tasks)  
    if filter.present? && filter == "All"
    elsif filter.present? && filter == "Completed"
      tasks = tasks.where(completed: true)
    else
      filter = "Incomplete"
      tasks = tasks.where(completed: false)
    end
    [filter, tasks]
  end
end
