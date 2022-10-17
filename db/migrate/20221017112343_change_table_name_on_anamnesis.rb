class ChangeTableNameOnAnamnesis < ActiveRecord::Migration[7.0]
  def change
    rename_table :anamnesis, :quizzes
  end
end
