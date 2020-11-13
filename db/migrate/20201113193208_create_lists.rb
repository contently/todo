class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name, required: true

      t.belongs_to :user
      t.belongs_to :task
      t.timestamps
    end
  end
end
