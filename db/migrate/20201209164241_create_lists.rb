class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.timestamps
    end
    add_reference :tasks, :list, index: true
  end
end
