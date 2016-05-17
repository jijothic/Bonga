require "rails_helper"
require 'capybara/rails'

RSpec.describe 'User sign up' do
  scenario "successfully" do
    visit new_user_registration_path
    fill_in "Username", with: "Example User"
    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
  end

  scenario 'unsuccessfully' do
  	visit new_user_registration_path
    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_on "Sign up"

    expect(page).to have_content "error"

  end
end
