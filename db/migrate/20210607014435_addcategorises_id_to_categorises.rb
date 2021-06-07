class AddcategoriesIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :categories_id, :integer
  end
end
