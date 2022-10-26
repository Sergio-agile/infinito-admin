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
    let(:category) { Category.new(title: 'general', title_to_display: 'General', order: 1) }
    subject { described_class.new(title: 'Random title', title_to_display: 'Title to display', order: 4, category_id: category) }

    # it "is valid with valid attributes" do
    #   subject.category = category
    #   expect(subject.category).to be_valid
    # end
    it 'expected to respond to categories' do
      expect(subject).to respond_to(:categories)
    end

    it 'expected to respond to quizzes_questions' do
      expect(subject).to respond_to(:quizzes_questions)
    end

    it 'expected to respond to quizzes' do
      expect(subject).to respond_to(:quizzes)
    end

    it 'should have a category with valid attributes' do
      p inspect(subject)
      expect(subject.category).to have_attributes(title: 'general', title_to_display: 'General', order: 1)
    end
  end
end
