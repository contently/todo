class CreateList < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
