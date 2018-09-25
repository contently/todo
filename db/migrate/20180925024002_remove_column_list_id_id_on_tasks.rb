class RemoveColumnListIdIdOnTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :list_id_id
  end
end
