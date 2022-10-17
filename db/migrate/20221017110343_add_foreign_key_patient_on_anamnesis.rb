class AddForeignKeyPatientOnAnamnesis < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :anamnesis, :patients
  end
end
