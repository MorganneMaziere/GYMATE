class ChangeColumnInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :starting_hour, :time
    change_column :events, :ending_hour, :time
  end
end
