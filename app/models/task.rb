# frozen_string_literal: true

class Task < ActiveRecord::Base

  has_paper_trail

  attribute :completed, :boolean, default: false
  validates :name, presence: true

  belongs_to :user
  belongs_to :list, optional: true

  scope :filter_by_completed, -> (is_completed) do
    is_completed = true if is_completed.is_a?(String) && is_completed == 'true'
    is_completed = false if is_completed.is_a?(String) && is_completed == 'false'
    where(completed: is_completed)
  end
  scope :filter_by_list, -> (list_id) do
    return where(list_id: list_id.to_i) if list_id
  end

end
