class Task < ActiveRecord::Base
  validates :name, :list_id, presence: true

  belongs_to :list
  belongs_to :user
  has_many :versions
end
