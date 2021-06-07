class CreateShippingCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_costs do |t|
      t.integer :shipping_costs_id, null: false
      t.timestamps
    end
  end
end
