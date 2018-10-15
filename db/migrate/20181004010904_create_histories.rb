class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :task_id
      t.string :name
      t.boolean :completed
      t.timestamps
    end
  end
end
