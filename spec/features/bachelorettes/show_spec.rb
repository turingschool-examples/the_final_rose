require 'rails_helper'

RSpec.describe "Bachelorette Show page", type: :feature do
  describe 'when visiting /bachelorettes/:id' do
    before :each do
      load_test_data
    end

    it "see the bachelorette's name, season number, description of season they were on" do
      visit "/bachelorettes/#{@bachelorette_1.id}"

      expect(page).to have_content("#{@bachelorette_1.name}")
      expect(page).to have_content("Season: #{@bachelorette_1.season_number}")
      expect(page).to have_content("#{@bachelorette_1.description}")
      expect(page).to_not have_content("#{@bachelorette_2.name}")
    end

    it 'see a link to see the bachelorettes contestants' do
      visit "/bachelorettes/#{@bachelorette_2.id}"

      expect(page).to have_link("#{@bachelorette_2.name}'s Contestants")
    end

    it "when contestant link is clicked, user is taken to /bachelorettes/:bachelorette_id/contestants"
    #:href bachelorette_contestants_path(@bachelorette_2.id)
    #build spec for /bach/bach_id/contestants
  end
end