class AddColumnToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :buddies_list, null: false, foreign_key: true
  end
end
