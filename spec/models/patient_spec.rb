require 'rails_helper'
require 'spec_helper'

RSpec.describe Patient, type: :model do
  patient = Patient.new(first_name: "First Name", last_name: "Last Name")
  it "is valid with valid attributes" do
    expect(patient).to be_valid
  end
  it "is not valid without a first_name" do
    patient.first_name = nil
    expect(patient).to be_invalid
  end
  it "is not valid without a last_name" do
    patient.last_name = nil
    expect(patient).to be_invalid
  end
  it "has many consultations" do
    should respond_to(:consultations)
  end
end
