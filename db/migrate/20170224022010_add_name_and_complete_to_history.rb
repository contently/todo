class AddNameAndCompleteToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :name, :string
    add_column :histories, :completed, :boolean
  end
end
