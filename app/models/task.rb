class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :completed, inclusion: { in: [false] }, on: :create

  belongs_to :list
end
