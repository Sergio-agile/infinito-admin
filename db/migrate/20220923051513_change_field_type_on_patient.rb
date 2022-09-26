class ChangeFieldTypeOnPatient < ActiveRecord::Migration[7.0]
  def change
    rename_column :patients, :birth_date, :birthdate
    change_column :patients, :birthdate, 'date USING CAST(birthdate AS date)'
  end
end
