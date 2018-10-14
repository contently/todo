class AddColumnListIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :list_id, :integer
    change_column_null :tasks, :list_id, null: false
  end
end
