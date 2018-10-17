class AddHistoryToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :history, :text
  end
end
