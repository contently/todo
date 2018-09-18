class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.datetime :updated_at
      t.string :description
    end
  end
end
