class AddCategoryReferenceToQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories, :sections
    add_reference :questions, :section, foreign_key: true, optional: true
  end
end
