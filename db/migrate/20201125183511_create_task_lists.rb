class CreateTaskLists < ActiveRecord::Migration[6.0]
  def change
    if (!table_exists? :task_lists)
      create_table :task_lists do |t|
        t.string :list_name

        t.timestamps
      end
    end
  end
end
