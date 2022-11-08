require 'rails_helper'
require 'spec_helper'

RSpec.describe Consultation, type: :model do
  it "belongs to a patient" do
    relation = Consultation.reflect_on_association(:patient)
    expect(relation.macro).to eq(:belongs_to)
  end
end
