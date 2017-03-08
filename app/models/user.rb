class User < ActiveRecord::Base
  # HW5: set up association and validations
  validates :name, presence: true
  has_many :lists, :dependent => :destroy
end
