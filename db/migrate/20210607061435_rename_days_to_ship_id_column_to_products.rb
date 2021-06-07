class RenameDaysToShipIdColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :days_to_ship_id, :days_to_ships_id
  end
end
