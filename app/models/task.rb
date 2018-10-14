# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user

  def self.select_by_completed(completed)
    where(completed: completed)
  end

  def self.completeds
    self.all.collect { |instance| instance.completed }.uniq
  end

end
