class AddReferencesToAnamnesis < ActiveRecord::Migration[7.0]
  def change
    rename_table :anamneses, :anamnesis
    add_reference :anamnesis, :patient, index: true
  end
end
