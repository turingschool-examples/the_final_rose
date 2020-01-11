require "rails_helper"

RSpec.describe "As a visitor" do
  before :each do
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "Season 15 - The Most Dramatic Season Yet!")
    @sarah = Bachelorette.create!(name: "Sarah Green", season_number: 15, season_description: "Season 15 - The Most Dramatic Season Yet!")
    @tiffany = Bachelorette.create!(name: "Tiffany Grey", season_number: 14, season_description: "Season 14 - The Most Sassiest Season Yet!")

    @danny = Contestant.create!(name: "Danny Moran", age: 26, hometown: "Denver, CO", bachelorette: @hannah)
    @daniel = Contestant.create!(name: "Daniel Maran", age: 30, hometown: "Lakewood, CO", bachelorette: @hannah)
    @alex = Contestant.create!(name: "Alex Moron", age: 26, hometown: "Aurora, CO", bachelorette: @sarah)
  end

  it "Can see bachelorettes' information" do
    visit "/bachelorettes/#{@hannah.id}"

    expect(page).to have_content(@hannah.name)
    expect(page).to have_content(@hannah.season_number)
    expect(page).to have_content(@hannah.season_description)

    expect(page).to have_link("Bachelorette's Contestants")    
  end

end
