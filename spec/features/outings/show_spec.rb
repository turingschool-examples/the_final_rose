require 'rails_helper'

RSpec.describe "outing show page", type: :feature do
  describe "display" do
    before do 
      test_data
    end

    it "has outing's name, location, date, and list of contestants" do
      visit outing_path(@outing2)
      
      expect(page).to have_content("Outing 2")
      expect(page).to have_content("Location: #{@outing2.location}")
      expect(page).to have_content("Date: #{@outing2.date}")
      expect(page).to have_content("Contestants:")
      @outing2.contestants.each do |contestant|
        expect(page).to have_content(contestant.name)
      end
    end
  end
end
