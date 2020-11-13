class FixCompletedDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tasks, :completed, false
  end
end
