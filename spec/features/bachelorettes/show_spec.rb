require "rails_helper"

RSpec.describe "As a visitor" do
  before :each do
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "Hannah Brown, Season 15 - The Most Dramatic Season Yet!")
    @sarah = Bachelorette.create!(name: "Sarah Green", season_number: 15, season_description: "Sarah Green, Season 15 - The Most Dramatic Season Yet!")
    @tiffany = Bachelorette.create!(name: "Tiffany Grey", season_number: 14, season_description: "Tiffany Grey, Season 14 - The Most Sassiest Season Yet!")

    @danny = Contestant.create!(name: "Danny Moran", age: 26, hometown: "Denver, CO", bachelorette: @hannah)
    @alex = Contestant.create!(name: "Alex Moron", age: 26, hometown: "Aurora, CO", bachelorette: @sarah)

  end

  it "Can see bachelorettes' information" do
    visit "/bachelorettes/#{@hannah.id}"

    expect(page).to have_content(@hannah.name)
    expect(page).to have_content(@hannah.season_number)
    expect(page).to have_content(@hannah.season_description)
  end

  it "can see a link to see that bachelorette's contestants" do
    visit "/bachelorettes/#{@hannah.id}"

    click_link("Bachelorette's Contestants")
    expect(current_path).to eq("/bachelorettes/#{@hannah.id}/contestants")
    
    expect(page).to have_content(@danny.name)
    expect(page).to_not have_content(@alex.name)
  end
end
# I also see a link to see that bachelorette's contestants
# When I click on that link
# I'm taken to "/bachelorettes/:bachelorette_id/contestants"
# and I can see only that bachelorette's contestants
