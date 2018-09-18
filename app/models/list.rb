class List < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :tasks
end
