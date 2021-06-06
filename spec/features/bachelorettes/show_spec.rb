require 'rails_helper'

RSpec.describe 'The show page for a bachelorette,' do
  before :all do
    @bachelorette_1 = Bachelorette.create!(name: "Clare Crawley", season_number: 16)

    visit "/bachelorettes/#{@bachelorette_1.id}"
  end

  it 'displays the bachelorettes attributes with season description' do
    within 'section#attributes'
      expect(page).to have_content(@bachelorette_1.name)
      expect(page).to have_content(@bachelorette_1.season_number)
      expect(page).to have_content("#{@bachelorette_1.season_number} - The Most Dramatic Season Yet!")
    end

  it 'displays a link for the bachelorettes contestants' do
    within 'section#contestants'
      expect(page).to have_link("#{@bachelorette_1.name}'s Contestants")
      save_and_open_page

      click_link("#{@bachelorette_1.name}'s Contestants")
      expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
    end
  end


# User Story 1 of 6
#
# As a visitor,
# When I visit '/bachelorettes/:id',
# I see that bachelorette's:
# -Name
# -Season Number
# -Description of Season that they were on
# (e.g.
#                   Hannah Brown
#     Season 15 - The Most Dramatic Season Yet!
#   )
# I also see a link to see that bachelorette's contestants
# When I click on that link
# I'm taken to "/bachelorettes/:bachelorette_id/contestants"
# and I can see only that bachelorette's contestants
