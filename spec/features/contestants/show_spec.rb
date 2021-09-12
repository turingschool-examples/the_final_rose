require 'rails_helper'

RSpec.describe 'contestant show page' do

  it 'shows the contestants name' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 2, season_description: "Great season")
    contestant = bachelorette.contestants.create!(name: "Tony", age: 25, hometown: "Denver")

    visit "/contestants/#{contestant.id}"

    expect(page).to have_content(contestant.name)
  end

  it 'shows the season number/ description this contestant is on' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Great season")
    contestant = bachelorette.contestants.create!(name: "Tony", age: 25, hometown: "Denver")

    visit "/contestants/#{contestant.id}"

    expect(page).to have_content(bachelorette.season_number)
    expect(page).to have_content(contestant.season_number)
    expect(page).to have_content(contestant.season_description)
  end

  it 'shows the name of the outings this contestant has been on' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Great season")
    contestant = bachelorette.contestants.create!(name: "Tony", age: 25, hometown: "Denver")
    outing_1 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")
    outing_2 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")

    visit "/contestants/#{contestant.id}"

    expect(page).to have_content(outing_1.name)
    expect(page).to have_content(outing_2.name)
  end

  it 'is a link to outings show page' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Great season")
    contestant = bachelorette.contestants.create!(name: "Tony", age: 25, hometown: "Denver")
    outing_1 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")
    outing_2 = contestant.outings.create!(name: "Dinner", location: "Venice Beach", date: "02/12/2021")

    visit "/contestants/#{contestant.id}"
    click_on "Boardwalk"

    expect(current_path).to eq("/outings/#{outing_1.id}")
  end
end
