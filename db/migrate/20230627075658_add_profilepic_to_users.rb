class AddProfilepicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profilepic, :string
  end
end
