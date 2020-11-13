# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  has_many :lists
  has_many :users, through: :lists
end
