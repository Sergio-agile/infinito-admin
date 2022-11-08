class DefineCategoryFields < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :title, :string, null: false
    add_column :categories, :title_to_display, :string, null: false
    add_column :categories, :order, :integer, null: false
  end
end
