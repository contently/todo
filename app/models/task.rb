# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  end
