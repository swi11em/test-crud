class AddColumnToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :price, :integer
  end
end
