class AddEmailAndDniToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :email, :string
    add_column :patients, :dni, :string
  end
end
