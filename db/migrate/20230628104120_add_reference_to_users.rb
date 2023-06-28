class AddReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :buddies_list, foreign_key: true
  end
end
