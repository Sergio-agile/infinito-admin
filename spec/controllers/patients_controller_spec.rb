require 'rails_helper'
require "spec_helper"
require "devise"

RSpec.describe PatientsController, type: :controller do
  before do
    @no_admin_user = User.where(admin: false).first
    @admin_user = User.where(admin: true).first
    @patient = Patient.first
  end
  describe "Index page with no admin user" do
    it "has a 200 status code" do
      sign_in @no_admin_user
      get :index
      expect(response.status).to eq(200)
    end
  end
  describe "Index page with admin user" do
    it "has a 200 status code" do
      sign_in @admin_user
      get :index
      expect(response.status).to eq(200)
    end
  end
end
