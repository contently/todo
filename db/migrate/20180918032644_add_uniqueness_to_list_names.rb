class AddUniquenessToListNames < ActiveRecord::Migration
  def change
    add_index :lists, :name, unique: true
  end
end
