class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|
      t.references :auditable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.string :label
      t.string :previous_value
      t.string :new_value

      t.timestamps
    end
  end
end
