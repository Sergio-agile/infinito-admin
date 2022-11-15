require "rails_helper"

RSpec.feature "User log in as admin" do
  scenario "they see the home page" do

    visit new_user_session_path

    expect(page).to have_content("Log in")

    fill_in 'user_email', with: 'sergio.garcia.sanjuan@gmail.com'
    fill_in 'user_password', with: 'Rictus123!'

    click_on 'Log in'


    # expect(current_path).to eq new_user_session_path
    expect(current_path).to eq root_path
    # expect(page).to have_content("Infinito - Admin")
  end
end
