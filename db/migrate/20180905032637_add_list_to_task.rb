class AddListToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :list, index: true, foreign_key: true
  end
end
