class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      # t.string :model_type
      t.integer :task_id
      t.string :changed_attribute
      t.string :changed_attribute_type
      t.string :changed_from
      t.string :changed_to

      t.timestamps null: false
    end
  end
end
