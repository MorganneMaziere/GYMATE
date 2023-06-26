class CreateBuddies < ActiveRecord::Migration[7.0]
  def change
    create_table :buddies do |t|

      t.timestamps
    end
  end
end
