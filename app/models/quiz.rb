class Quiz < ApplicationRecord
  belongs_to :patient
  has_many :quizzes_questions
  has_many :questions, through: :quizzes_questions
end
