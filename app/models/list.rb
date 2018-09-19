class List < ActiveRecord::Base
  validates :name, presence: true

  has_many :list_items

  accepts_nested_attributes_for :list_items, reject_if: lambda {|attributes| attributes['description'].blank?}, allow_destroy: true

end
