require "rails_helper"

RSpec.describe Category, type: :model do
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
  end

  context 'with required fields' do
    subject { described_class.new(title: 'foo', title_to_display: 'bar', order: 'pepe') }
    let(:question) { Question.new(title: 'One question', title_to_display:'One questino for you', order: 1, category: subject) }

    it 'expected to have required attributes' do
      expect(subject).to have_attributes(title: 'foo', title_to_display: 'bar', order: 4)
    end

    it 'expected to have a numeric order' do
      expect((subject.order).is_a? Integer).to be_truthy
    end

    it 'expected to respond to question' do
      expect(subject).to respond_to(:question)
    end


  end
end
