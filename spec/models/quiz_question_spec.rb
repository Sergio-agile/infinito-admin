RSpec.describe QuizQuestion, type: :model do
  it { should respond_to(:quizzes_questions) }
  it { should respond_to(:quizzes) } # through quizzes_questions
end
