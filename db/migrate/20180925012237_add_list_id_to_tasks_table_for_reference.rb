class AddListIdToTasksTableForReference < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :list, index: true
  end
end
