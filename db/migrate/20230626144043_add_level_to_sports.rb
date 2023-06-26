class AddLevelToSports < ActiveRecord::Migration[7.0]
  def change
    add_column :sports, :description, :string
    add_column :sports, :level, :string
  end
end
