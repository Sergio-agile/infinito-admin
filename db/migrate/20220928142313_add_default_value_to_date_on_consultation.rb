class AddDefaultValueToDateOnConsultation < ActiveRecord::Migration[7.0]
  def change
    change_column :consultations, :date, :date, default: Date.today
  end
end
