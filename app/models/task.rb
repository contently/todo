# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  after_update :record

  belongs_to :user

  def self.select_by_completed(completed)
    where(completed: completed)
  end

  def self.completion
    self.all.collect { |instance| instance.completed }.uniq
  end

  def record
    self.changes
  end

end
