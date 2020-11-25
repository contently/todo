class AddDefaultToTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :completed, :boolean, default: false, null: false
  end
end
