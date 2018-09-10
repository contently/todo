class AddListIdToListItems < ActiveRecord::Migration
  def change
    add_reference :list_items, :list, index: true, foreign_key: true
  end
end
