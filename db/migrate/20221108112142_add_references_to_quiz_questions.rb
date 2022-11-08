class AddReferencesToQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_table :quiz_questions, :quizzes_questions
    add_reference :quizzes_questions, :quizzes, foreign_key: true
    add_reference :quizzes_questions, :questions, foreign_key: true
  end
end
