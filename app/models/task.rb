class Task < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true

  def initialize(*)
    super
    self.completed ||= false
  end
end
