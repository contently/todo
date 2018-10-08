class AddListRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :list, foreign_key: true
  end
end
