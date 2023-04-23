require 'rails_helper'

RSpec.describe "bachelorettes/contestants_index", type: :feature do
  describe "display" do
    before do 
      test_data
    end

    it "has contestants' names, ages, and hometown" do
      contestants = @bach2.contestants
      visit bachelorette_contestants_path(@bach2)

      expect(page).to have_content("Bach 2's contestants")

      contestants.each do |contestant|
        expect(page).to have_link(contestant.name, href: contestant_path(contestant))
        expect(page).to have_content(contestant.age)
        expect(page).to have_content(contestant.hometown)
      end
    end
  end
end