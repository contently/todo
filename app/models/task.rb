class Task < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
  has_paper_trail

  # Filter based on the completed attribute
  # Return completed tasks only if filter param is 'completed', else return incomplete tasks
  def self.filter_on_completed(filter_param=nil)
    case filter_param
    when 'completed'
      where(completed: true)
    else
      where(completed: false)
    end
  end
end
