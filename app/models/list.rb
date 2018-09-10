class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true

  def incomplete_tasks
    self.tasks.select {|task| task.completed == false}
  end

  def completed_tasks
    self.tasks.select {|task| task.completed == true}
  end

end
