class RemoveNullConstraintFromLists < ActiveRecord::Migration
  def change
    change_column :lists, :user_id, :integer, :null => true
  end
end
