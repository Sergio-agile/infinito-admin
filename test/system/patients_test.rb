require "application_system_test_case"
# require 'test_helper'

class PatientsTest < ApplicationSystemTestCase
  test "visiting the index with existing user" do
    login_as users(:sergio)
    visit root_url

    assert_selector "h1", text: "Patients"
  end

  test "visiting the index without login" do
    visit root_url

    assert_selector "div", text: "You need to sign in or sign up before continuing."
  end
end
