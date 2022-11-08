require 'rails_helper'
require 'spec_helper'

RSpec.describe Patient, type: :model do
  subject { described_class.new(first_name: "First Name", last_name: "Last Name") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to be_invalid
  end

  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to be_invalid
  end

  it "has many consultations" do
    relation = Patient.reflect_on_association(:consultations)
    expect(relation.macro).to eq(:has_many)
  end

  it "has one quiz" do
    relation = Patient.reflect_on_association(:quiz)
    expect(relation.macro).to eq(:has_one)
  end
end
