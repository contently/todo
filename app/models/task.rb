# frozen_string_literal: true

class Task < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true
end
