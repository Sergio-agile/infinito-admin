class DefineQuestionTable < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :title, :string, null: false
    add_column :questions, :title_to_display, :string, null: false
    add_column :questions, :order, :integer, null: false
    add_reference :questions, :category, foreign_key: true
  end
end
