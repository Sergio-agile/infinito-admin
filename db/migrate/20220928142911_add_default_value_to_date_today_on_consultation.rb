class AddDefaultValueToDateTodayOnConsultation < ActiveRecord::Migration[7.0]
  def change
    change_column :consultations, :date, :date, default: -> { 'CURRENT_DATE' }
  end
end
