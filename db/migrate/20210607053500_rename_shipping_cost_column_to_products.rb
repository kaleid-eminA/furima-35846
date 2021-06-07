class RenameShippingCostColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :shipping_cost_id, :shipping_costs_id
  end
end
