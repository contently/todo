# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  has_many :task_audits
  belongs_to :user
end
