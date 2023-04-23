require 'rails_helper'

RSpec.describe "contestant show page", type: :feature do
  describe "display" do
    before do 
      test_data
    end

    it "has contestant's name, season number, season description, and names of outings" do
      visit contestant_path(@cont9)

      expect(page).to have_content("Cont 9")
      expect(page).to have_content("Season 3 - This is the third season")
      expect(page).to have_link("Outing 1", href: outing_path(@outing1))
      expect(page).to have_link("Outing 8", href: outing_path(@outing8))
      
      visit bachelorette_contestants_path(@bach2)
      click_link ("Cont 5")

      expect(page).to have_content("Cont 5")
      expect(page).to have_content("Season 2 - This is the second season")
      expect(page).to have_link("Outing 4", href: outing_path(@outing4))
      expect(page).to have_link("Outing 5", href: outing_path(@outing5))
    end
  end
end
