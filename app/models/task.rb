# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Task < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
end
