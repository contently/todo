class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: [:user_id] }
end
