class AddSelfReferenceToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :category, foreign_key: true, optional: true
  end
end
