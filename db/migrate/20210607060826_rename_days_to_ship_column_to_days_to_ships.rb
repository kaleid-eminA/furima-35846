class RenameDaysToShipColumnToDaysToShips < ActiveRecord::Migration[6.0]
  def change
    rename_column :days_to_ships, :days_to_ship_id, :days_to_ships_id
  end
end
