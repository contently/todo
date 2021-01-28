# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true
  validate :incomplete, on: :create

  def completed?
    completed == true
  end

  def incomplete
    return if persisted?

    errors.add(:complete, 'can\'t be true') if completed?
  end
end
