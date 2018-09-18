class Task < ActiveRecord::Base
  validates :name, :user_id, :list_id, presence: true

  belongs_to :list
  belongs_to :user
end
