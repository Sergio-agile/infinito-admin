class ChangeColumnsTypeOnConsultationTable < ActiveRecord::Migration[7.0]
  def change
    change_column :consultations, :notes_before, :text
    change_column :consultations, :notes_after, :text
  end
end
