# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class List < ApplicationRecord
  validates :name, :user, presence: true

  belongs_to :user
  has_many :tasks
end
