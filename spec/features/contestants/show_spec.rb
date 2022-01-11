require 'rails_helper'

RSpec.describe 'contestants show page' do
  let!(:bachelorette_1) {Bachelorette.create!(name: "Wonder Woman", season_number: 1, description: "Funny Season")}
  let!(:bachelorette_2) {Bachelorette.create!(name: "Cat Woman", season_number: 2, description: "Awkward Season")}

  let!(:contestant_1) {bachelorette_1.contestants.create!(name: "Jerry", age: 10, hometown: "Denver")}
  let!(:contestant_2) {bachelorette_1.contestants.create!(name: "Layne", age: 20, hometown: "Tacoma")}
  let!(:contestant_3) {bachelorette_2.contestants.create!(name: "Zakk", age: 300, hometown: "Laporte")}

  let!(:outing_1) {Outing.create!(name: "Black Label Society Live", location: "Oriental Theater", date: "June 10th, 1992")}
  let!(:outing_2) {Outing.create!(name: "Alice In Chains Live", location: "Seattle", date: "May 1st, 1990")}
  let!(:outing_3) {Outing.create!(name: "NAMM", location: "Anneheim", date: "May 1st, 2022")}

  let!(:outing_contestants_1) {OutingContestant.create!(contestant: contestant_1, outing: outing_1)}
  let!(:outing_contestants_2) {OutingContestant.create!(contestant: contestant_1, outing: outing_2)}
  let!(:outing_contestants_3) {OutingContestant.create!(contestant: contestant_2, outing: outing_1)}
  let!(:outing_contestants_4) {OutingContestant.create!(contestant: contestant_3, outing: outing_2)}

  it 'shows the contestants name' do 
    visit "/contestants/#{contestant_1.id}"

    expect(page).to have_content(contestant_1.name)
    expect(page).to_not have_content(contestant_2.name)
  end

  it 'shows the contestants season number' do 
    visit "/contestants/#{contestant_1.id}"

    expect(page).to have_content(bachelorette_1.season_number)
    expect(page).to_not have_content(bachelorette_2.season_number)
  end

  it 'show the contestants season description' do 
    visit "/contestants/#{contestant_1.id}"

    expect(page).to have_content(bachelorette_1.description)
    expect(page).to_not have_content(bachelorette_2.description)
  end

  it 'shows the outings for the contestant was a part of while on the show' do 
    visit "/contestants/#{contestant_1.id}"

    expect(page).to have_content(outing_1.name)
    expect(page).to have_content(outing_2.name)

    expect(page).to_not have_content(outing_3.name)
  end

  it 'has a link to the outing show page' do 
    visit "/contestants/#{contestant_1.id}"

    click_link "#{outing_1.name}"

    expect(current_path).to eq("/outings/#{outing_1.id}")
  end
end