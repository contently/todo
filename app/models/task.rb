class Task < ActiveRecord::Base
  validates :name, presence: true

  has_many :audits

  after_save :update_audit_table

  def update_audit_table
    # { "name" => [], "completed" => [old,new]}
    # binding.pry
    changes.select {|k,v| k == 'name' || k == 'completed' }.each do |attr, changed|
      audits << Audit.new(changed_attribute: attr, changed_from: changed.first, changed_to: changed.last)
    end
  end
end