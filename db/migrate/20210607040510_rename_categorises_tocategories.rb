class RenamCategoriesTocategories < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories, :categories
  end
end
