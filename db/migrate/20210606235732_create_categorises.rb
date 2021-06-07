class CreateCategorises < ActiveRecord::Migration[6.0]
  def change
    create_table :categorises do |t|

      t.timestamps
    end
  end
end
