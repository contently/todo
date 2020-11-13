# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  has_many :lists
  has_many :users, through: :lists
  
  scope :complete_tasks, -> { where(completed: true)}
  scope :incomplete_tasks, -> { where(completed: false)}
  # Ex:- scope :active, -> {where(:active => true)}
end
