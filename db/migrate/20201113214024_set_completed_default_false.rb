class SetCompletedDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tasks, :completed, true
  end
end
