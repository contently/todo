class CreateTaskChanges < ActiveRecord::Migration
  def change
    create_table :task_changes do |t|
      t.string :action
      t.integer :task_id
      t.timestamps null: false
    end
  end
end
