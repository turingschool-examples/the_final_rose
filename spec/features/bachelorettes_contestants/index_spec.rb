require 'rails_helper'

RSpec.describe 'bachelorette contestants page' do
  it 'shows all that bachelorettes contestants' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Was a great season")
    contestant_1 = bachelorette.contestants.create!(name: "John", age: 25, hometown: "Denver")
    contestant_2 = bachelorette.contestants.create!(name: "Tony", age: 30, hometown: "Seattle")

    visit "/bachelorettes/#{bachelorette.id}/contestants"

    expect(page).to have_content(contestant_1.name)
    expect(page).to have_content(contestant_2.name)
  end

  it 'has all of the contestants information' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Was a great season")
    contestant_1 = bachelorette.contestants.create!(name: "John", age: 25, hometown: "Denver")
    contestant_2 = bachelorette.contestants.create!(name: "Tony", age: 30, hometown: "Seattle")

    visit "/bachelorettes/#{bachelorette.id}/contestants"

    expect(page).to have_content(contestant_2.name)
    expect(page).to have_content(contestant_2.age)
    expect(page).to have_content(contestant_2.hometown)
  end

  it 'has a link for each contestants name to their showpage' do
    bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Was a great season")
    contestant_1 = bachelorette.contestants.create!(name: "John", age: 25, hometown: "Denver")
    contestant_2 = bachelorette.contestants.create!(name: "Tony", age: 30, hometown: "Seattle")

    visit "/bachelorettes/#{bachelorette.id}/contestants"
    click_on "Tony"

    expect(current_path).to eq("/contestants/#{contestant_2.id}")
  end
end
