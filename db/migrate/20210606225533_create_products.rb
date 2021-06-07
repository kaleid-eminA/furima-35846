class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,                foreign_key: true
      t.string  :name,                   null: false, default: ""
      t.text  :description,              null: false
      t.integer  :condition_id,          null: false
      t.integer  :shipping_cost_id,      null: false
      t.integer  :prefecture_id,         null: false
      t.integer  :days_to_ship_id,       null: false
      t.integer :categories_id,          null: false
      t.integer :price,                  null: false

      t.timestamps
    end
  end
end
