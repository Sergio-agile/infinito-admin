require "rails_helper"

RSpec.feature "User submits a main section" do
  scenario "they see the main section in the section list" do
    # TODO: refactor this
    ############### login
    user = User.where("where email = 'sergio.garcia.sanjuan@gmail.com'")

    visit new_user_session_path

    expect(current_path).to eq '/users/sign_in'



    # expect(page).to have_content("Log in")

    # find('#user_email').fill_in with: 'sergio.garcia.sanjuan@gmail.com'
    # find('#user_password').fill_in with: 'Rictus123!'

    # click_button('commit')

    # expect(current_path).to eq root_path
    # expect(page).to have_content("Infinito - Admin")

    #######################


    # visit new_section_path
    # visit '/sections/new'

    # expect(current_path).to eq '/sections/new'

    # section_title = "This is a Main Section Title"
    # section_title_to_display = "This is a Main Section Title to Display"
    # section_order = 4

    # fill_in "section_title", with: section_title
    # fill_in "section_title_to_display", with: section_title_to_display
    # fill_in "section_order", with: section_order

    # click_button('Save')
    # click_on "Save"
    # TODO: remove comment and delete the line below
    # expect(page).to have_content("New Section")
    # expect(page).to have_content(section_title)
  end
end
