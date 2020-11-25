class AddUserToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :user, null: true, foreign_key: true
  end
end
