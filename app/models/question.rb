class Question < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :title_to_display, presence: true, allow_blank: false
  validates :order, presence: true, allow_blank: false
  belongs_to :section
  has_many :quizzes_questions
  has_many :quizzes, through: :quizzes_questions
end
