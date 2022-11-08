require "rails_helper"

RSpec.describe Quiz, type: :model do
  context 'with an existing patient' do
    subject { described_class.new }
    let(:patient) { Patient.new(first_name: 'John', last_name: 'Doe') }

    it "belongs to patient" do
      relation = Quiz.reflect_on_association(:patient)
      expect(relation.macro).to eq(:belongs_to)
    end

    it "has many quizzes_questions" do
      relation = Quiz.reflect_on_association(:quizzes_questions)
      expect(relation.macro).to eq(:has_many)
    end

    it 'has many questions through quizzes_questions' do
      relation = Quiz.reflect_on_association(:quizzes_questions)
      expect(relation.macro).to eq(:has_many)
    end
  end

  # TODO: This is not really working.
  context 'with no patient' do
    it 'throws an error when no patient is setted' do
      subject.patient = nil
      expect { subject.create }.to raise_error
    end
  end
end
