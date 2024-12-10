class AddColumTo < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :address, :string
  end
end
