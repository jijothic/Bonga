require "rails_helper"

RSpec.feature "User visits homepage" do
   scenario "successully and sees a logo" do
    	visit root_path
    	except(page).to have_content "Bonga"
  end
end
