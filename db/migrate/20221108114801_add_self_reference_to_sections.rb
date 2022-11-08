class AddSelfReferenceToSections < ActiveRecord::Migration[7.0]
  def change
    add_reference :sections, :section, foreign_key: true, optional: true
  end
end
