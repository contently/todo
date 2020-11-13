# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  has_many :lists
  has_many :users, through: :lists

  belongs_to :list
  
  scope :complete, -> { where(completed: true)}
  scope :incomplete, -> { where(completed: false)}
  # Ex:- scope :active, -> {where(:active => true)}
end
