class FixValidations < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :session_token
    remove_column :tasks, :user_id
    add_column :users, :session_token, :string
    add_column :tasks, :user_id, :integer, null: false, default: 0
  end
end
