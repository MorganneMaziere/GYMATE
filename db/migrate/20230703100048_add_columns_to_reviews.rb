class AddColumnsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :buddies_list, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
    remove_column :reviews, :booking_id
  end
end
