require 'rails_helper'

RSpec.describe "Bachelorette Show Page", type: :feature do
  describe "as a visitor when I visit the '/bachelorettes/:id'" do
    it "I see that bachelorette's info" do
      hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 17)
      tyler = hannah.contestants.create!(name: "Tyler Bigmouth", age: 29, hometown: "Somewhere in Ohio")

      visit "/bachelorettes/#{hannah.id}"

      expect(page).to have_content(hannah.name)
      expect(page).to have_content(hannah.season_number)
      expect(page).to have_content("The Most Dramatic Season Yet!")
    end

    it "I see a link to the bachelorette's contestants" do
      hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 17)
      tyler = hannah.contestants.create!(name: "Tyler Bigmouth", age: 29, hometown: "Somewhere in Ohio")
      steve = hannah.contestants.create!(name: "Steve Jeevee", age: 21, hometown: "TEXAS")

      visit "/bachelorettes/#{hannah.id}"

      expect(page).to have_link("Contestants")

      click_link("Contestants")

      expect(current_path).to eq("/bachelorettes/#{hannah.id}/contestants")
      expect(page).to have_content(tyler.name)
      expect(page).to have_content(steve.name)
    end
  end
end



# I also see a link to see that bachelorette's contestants
# When I click on that link
# I'm taken to "/bachelorettes/:bachelorette_id/contestants"
# and I can see only that bachelorette's contestants
