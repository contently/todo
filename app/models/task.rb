class Task < ActiveRecord::Base
  validates :name, presence: true

  # HW1: ensure completed is falsy on create at the model level
  validates :completed, absence: true, on: :create

  # HW4: set up association
  belongs_to :list
  validates :list, presence: true

end
