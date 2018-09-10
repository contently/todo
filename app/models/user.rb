class User < ActiveRecord::Base
  has_secure_password
  has_many :lists, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: true

end
