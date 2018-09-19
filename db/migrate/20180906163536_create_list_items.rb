class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
