class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, dependent: :destroy

  # Check if user is the owner of this resource
  def owner?(resource)
    raise 'Unauthorized' unless self == resource.user
  end
end
