require "rails_helper"

RSpec.describe Quiz, type: :model do
  context 'with an existing patient' do
    subject { described_class.new }
    let(:patient) { Patient.new(first_name: 'John', last_name: 'Doe') }

    it 'should be invalid with no patient' do
      expect(subject).to be_invalid
    end

    it 'should belongs to a patient' do
      subject.patient = patient
      expect(subject.patient).to equal(patient)
      expect(subject).to be_valid
    end

    it 'expected to respond to quizzes_questions' do
      expect(subject).to respond_to(:quizzes_questions)
    end

    it 'expected to respond to quizzes' do
      expect(subject).to respond_to(:questions)
    end

    it 'should have a valid patient' do
      subject.patient = patient
      expect(subject.patient).to have_attributes(first_name: 'John', last_name: 'Doe')
    end
  end

  context 'with no patient' do
    it 'throws an error when no patient is setted' do
      subject.patient = nil
      expect { subject.create }.to raise_error
    end
  end
end
