# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  validate :persist_before_completion, if: proc { |k| k.new_record? }

  scope :complete, -> { where(completed: true) }
  scope :pending, -> { where.not(completed: true) }

  private

  def persist_before_completion
    errors.add(:completed, "can't be set during creation!") and return false if completed?
  end
end
