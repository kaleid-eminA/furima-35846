class AddcategorisesIdToCategorises < ActiveRecord::Migration[6.0]
  def change
    add_column :categorises, :categorises_id, :integer
  end
end
