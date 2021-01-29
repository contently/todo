# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list, optional: true

  validates :name, presence: true
  validate :incomplete, on: :create

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where.not(completed: true) }

  has_many :audits, as: :auditable
  before_update :build_audits

  def build_audits
    changes.except(:updated_at).each do |attribute, values|
      audits.build(label: attribute, previous_value: values.first, new_value: values.last, user: user)
    end
  end

  def completed?
    completed == true
  end

  def incomplete
    return if persisted?

    errors.add(:complete, 'can\'t be true') if completed?
  end
end
