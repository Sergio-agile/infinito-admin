class ChangeCategoryNameToSection < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :sections
  end
end
