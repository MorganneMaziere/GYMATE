class AddColumnToBuddieslists < ActiveRecord::Migration[7.0]
  def change
    add_column :buddies_lists, :confirmed, :boolean
  end
end
