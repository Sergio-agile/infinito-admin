class RenameSectionsToCagoriesAndDeleteSelfReference < ActiveRecord::Migration[7.0]
  def change
    rename_table :sections, :categories
    remove_reference :categories, :category, index: true, foreign_key: true
  end
end
