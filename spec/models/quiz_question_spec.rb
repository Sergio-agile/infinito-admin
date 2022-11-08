RSpec.describe QuizQuestion, type: :model do
  it "belongs to a Quiz" do
    relation = QuizQuestion.reflect_on_association(:quiz)
    expect(relation.macro).to eq(:belongs_to)
  end

  it "belongs to a Question" do
    relation = QuizQuestion.reflect_on_association(:question)
    expect(relation.macro).to eq(:belongs_to)
  end
end
