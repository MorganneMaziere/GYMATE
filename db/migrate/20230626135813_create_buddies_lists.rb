class CreateBuddiesLists < ActiveRecord::Migration[7.0]
  def change
    create_table :buddies_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :buddy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
