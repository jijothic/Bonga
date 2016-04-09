require "rails_helper"

#checks for user visits
RSpec.feature "User visits hompage" do
	scenario "successfully and sees a logo" do
		visit root_path
		expect(page).to have_content "Bonga"

	end
end