# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  belongs_to :list
  end
