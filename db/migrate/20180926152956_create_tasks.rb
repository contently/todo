# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, :default => false
      t.integer :list_id

      t.timestamps
    end
  end
end
