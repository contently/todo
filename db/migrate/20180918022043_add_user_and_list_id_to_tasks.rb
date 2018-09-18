class AddUserAndListIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :list_id, :integer
    add_column :tasks, :user_id, :integer
  end
end
