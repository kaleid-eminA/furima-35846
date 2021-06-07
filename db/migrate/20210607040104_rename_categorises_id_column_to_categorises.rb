class RenameCategoriesIdColumnToCategories < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :categories_id, :categories_id
  end
end
