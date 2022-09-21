class CreateConsutlations < ActiveRecord::Migration[7.0]
  def change
    create_table :consutlations do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :notes_before
      t.string :notes_after
      t.date :date

      t.timestamps
    end
  end
end
