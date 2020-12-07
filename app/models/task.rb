# frozen_string_literal: true

# TODO: add list_id references db migration.

class Task < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  validate :persist_before_completion, if: proc { |k| k.new_record? }

  scope :complete, -> { where(completed: true) }
  scope :pending, -> { where.not(completed: true) }

  private

  def persist_before_completion
    errors.add(:completed, "can't be set during creation!") and return false if completed?
  end
end
