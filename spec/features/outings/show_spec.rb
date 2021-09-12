require 'rails_helper'

RSpec.describe 'outings show page' do

  it 'shows outing information' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Great season")
    contestant = bachelorette.contestants.create!(name: "Tony", age: 25, hometown: "Denver")
    outing_1 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")


    visit "/outings/#{outing_1.id}"

    expect(page).to have_content(outing_1.name)
    expect(page).to have_content(outing_1.location)
    expect(page).to have_content(outing_1.date)
  end

  it 'has a total count of contestants on this outing' do
    bachelorette = Bachelorette.create!(name: "Sam", season_number: 5, season_description: "Great season")
    outing_1 = Outing.create!(name: "Ice Skating", location: "Aurora", date: "03/21/1060")
    contestant_1 = outing_1.contestants.create!(name: "Tony", age: 35, hometown: "New York", bachelorette_id: bachelorette.id)
    contestant_2 = outing_1.contestants.create!(name: "Sam", age: 37, hometown: "Seattle", bachelorette_id: bachelorette.id)

    visit "/outings/#{outing_1.id}"

    expect(page).to have_content(2)
  end
end
