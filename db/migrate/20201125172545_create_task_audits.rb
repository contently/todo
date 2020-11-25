class CreateTaskAudits < ActiveRecord::Migration[6.0]
  def change
    create_table :task_audits do |t|
      t.references :task, null: false, foreign_key: true
      t.string :audit_action
      t.string :from_value
      t.string :to_value

      t.timestamps
    end
  end
end
