class AddListToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :list, null: true, foreign_key: true
  end
end
