class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.integer :conditions_id, null: false

      t.timestamps
    end
  end
end
