require 'rails_helper'
# User visits homepage
RSpec.feature 'User visits homepage' do
   scenario 'successully and sees a logo' do
      visit root_path
      expect(page).to have_content 'Bonga'
   end
end
