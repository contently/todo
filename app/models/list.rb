# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord
  validates :name, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :name, message: "list titles must be unique"}

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_many :tasks,
    class_name: :Task,
    foreign_key: :list_id,
    primary_key: :id

end
