require 'rails_helper'

RSpec.describe "bachelorettes show page", type: :feature do
  describe "display" do
    before do
      test_data
    end

    it "shows name, season number, and description" do
      visit "/bachelorettes/#{@bach1.id}"

      expect(page).to have_content("#{@bach1.name}")
      expect(page).to have_content("Season 1")
      expect(page).to have_content("This is the first season")
    end
  end

  describe "stats" do
    before do
      test_data
    end

    it "#average_age on page" do
      visit bachelorette_path(@bach1)

      within("#stats") do
        expect(page).to have_content("Average age: 25")
      end

      visit bachelorette_path(@bach2)

      within("#stats") do
        expect(page).to have_content("Average age: 40")
      end

      visit bachelorette_path(@bach3)

      within("#stats") do
        expect(page).to have_content("Average age: 55")
      end
    end
  end
end