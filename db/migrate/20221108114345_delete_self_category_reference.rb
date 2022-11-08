class DeleteSelfCategoryReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questions, :category, index: true, foreign_key: true
  end
end
