require 'rails_helper'

RSpec.describe 'bachelorette show page' do

  it 'shows a bachelorettes information' do
    bachelorette = Bachelorette.create!(name: "Jessica", season_number: 2, season_description: "A great season")

    visit "/bachelorettes/#{bachelorette.id}"

    expect(page).to have_content(bachelorette.name)
    expect(page).to have_content(bachelorette.season_number)
    expect(page).to have_content(bachelorette.season_description)
  end

  it 'has a link to route to bachelorettes contestants' do
    bachelorette = Bachelorette.create!(name: "Jessica", season_number: 2, season_description: "A great season")

    visit "/bachelorettes/#{bachelorette.id}"
    click_on "Contestants"

    expect(current_path).to eq("/bachelorettes/#{bachelorette.id}/contestants")
  end
end
