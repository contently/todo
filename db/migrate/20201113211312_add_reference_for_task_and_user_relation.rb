class AddReferenceForTaskAndUserRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :list, foreign_key: true
  end
end
