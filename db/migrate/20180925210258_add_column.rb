class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :list_id, :integer
  end
end
