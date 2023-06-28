class AddImageToSport < ActiveRecord::Migration[7.0]
  def change
    add_column :sports, :image, :string
  end
end
