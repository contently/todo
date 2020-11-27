# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  has_many :task_audits, :dependent => :delete_all
  belongs_to :user, optional: true
  belongs_to :task_list, optional: true
end
