class List < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :task
end
