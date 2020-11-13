class List < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :task, optional: true

  has_many :tasks
end
