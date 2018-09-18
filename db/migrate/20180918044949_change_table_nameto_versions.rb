class ChangeTableNametoVersions < ActiveRecord::Migration
  def change
    rename_table :changes, :versions
  end
end
