require "rails_helper"

RSpec.describe Question, type: :model do

  context 'without required fields' do
    subject { described_class.new }

    it 'is not valid without a title' do
      expect(subject).to be_invalid
    end

    it 'is not valid without a title_to_display' do
      expect(subject).to be_invalid
    end

    it 'is not valid without an order' do
      expect(subject).to be_invalid
    end

    it 'is not valid without a category' do
      expect(subject).to be_invalid
    end
  end

  context 'with required fields' do
    let(:section) { Section.new(title: 'general', title_to_display: 'General', order: 1) }
    subject { described_class.new(title: 'Random title', title_to_display: 'Title to display', order: 4, section_id: section) }

    # it "is valid with valid attributes" do
    #   subject.category = category
    #   expect(subject.category).to be_valid
    # end

    it "belongs to a category" do
      relation = Question.reflect_on_association(:section)
      expect(relation.macro).to eq(:belongs_to)
    end

    it "has many quizzes_questions" do
      relation = Question.reflect_on_association(:quizzes_questions)
      expect(relation.macro).to eq(:has_many)
    end

    it 'has many questions through quizzes_questions' do
      relation = Question.reflect_on_association(:quizzes_questions)
      expect(relation.macro).to eq(:has_many)
    end

    # it 'should have a category with valid attributes' do
    #   p inspect(subject)
    #   expect(subject.category).to have_attributes(title: 'general', title_to_display: 'General', order: 1)
    # end
  end
end
