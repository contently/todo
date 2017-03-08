class List < ActiveRecord::Base
  # HW4: set up association and validations
  validates :name, presence: true
  has_many :tasks, :dependent => :destroy

  # HW5: set up association to user
  belongs_to :user
  validates :user, presence: true
end
