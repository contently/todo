class ChangeAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :user_id, :integer, :null => true
    change_column :tasks, :task_list_id, :integer, :null => true
  end
end
