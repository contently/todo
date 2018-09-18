class AddUserAndListIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :list_id, :integer, null: false
    add_column :tasks, :user_id, :integer, null: false
  end
end
