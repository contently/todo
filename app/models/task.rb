# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  has_many :histories
end
