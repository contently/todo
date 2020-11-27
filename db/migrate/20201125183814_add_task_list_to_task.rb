class AddTaskListToTask < ActiveRecord::Migration[6.0]
  def change
    if !column_exists?(:tasks, :task_list_id)
      add_reference :tasks, :task_list, null: false, foreign_key: true
    end
  end
end
