class AddTaskForeignKeyToChanges < ActiveRecord::Migration
  def change
    add_column :changes, :task_id, :integer
  end
end
