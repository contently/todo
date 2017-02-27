class Task < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :users
  has_many :histories
end
