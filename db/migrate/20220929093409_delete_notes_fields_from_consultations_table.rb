class DeleteNotesFieldsFromConsultationsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :consultations, :notes_before
    remove_column :consultations, :notes_after
  end
end
