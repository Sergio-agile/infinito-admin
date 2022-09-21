class UpdateModelName < ActiveRecord::Migration[7.0]
  def change
    rename_table :consutlations, :consultations
  end
end
