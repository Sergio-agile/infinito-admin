require "application_system_test_case"
# require 'test_helper'

class NewPatientsTest < ApplicationSystemTestCase
  test "Creating a new Patient with admin user" do
    login_as users(:sergio)
    visit new_patient_path

    fill_in "patient_first_name", with: "Alfredo"
    fill_in "patient_last_name", with: "Kraus"

    click_button('Save')

    assert_selector "h1", text: "Patient details"
  end

  test "Creating a new Patient with NO admin user" do
    login_as users(:sircheti)
    visit new_patient_path

    fill_in "patient_first_name", with: "Alfredo"
    fill_in "patient_last_name", with: "Kraus"

    assert_selector "input[type='submit']", count: 0
  end

  test "Creating a new Patient without first_name / last_name" do
    login_as users(:sergio)
    visit new_patient_path

    click_button('Save')

    assert_selector ".invalid-feedback", text: "First name can't be blank"
    assert_selector ".invalid-feedback", text: "Last name can't be blank"
  end
end
