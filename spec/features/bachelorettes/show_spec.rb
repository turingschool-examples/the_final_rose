require 'rails_helper'

RSpec.describe 'bachelorettes show page' do
  let!(:bachelorette_1) {Bachelorette.create!(name: "Wonder Woman", season_number: 1, description: "Funny Season")}
  let!(:bachelorette_2) {Bachelorette.create!(name: "Cat Woman", season_number: 2, description: "Awkward Season")}

  let!(:contestant_1) {bachelorette_1.contestants.create!(name: "Jerry", age: 10, hometown: "Denver")}
  let!(:contestant_2) {bachelorette_1.contestants.create!(name: "Layne", age: 20, hometown: "Tacoma")}
  let!(:contestant_3) {bachelorette_2.contestants.create!(name: "Zakk", age: 300, hometown: "Laporte")}

  let!(:outing_1) {Outing.create!(name: "Concert", location: "Oriental Theater", date: "June 10th, 1992")}
  let!(:outing_2) {Outing.create!(name: "NAMM", location: "Anneheim", date: "May 1st, 2022")}

  let!(:outing_contestants_1) {OutingContestant.create!(contestant: contestant_1, outing: outing_1)}
  let!(:outing_contestants_2) {OutingContestant.create!(contestant: contestant_2, outing: outing_1)}
  let!(:outing_contestants_3) {OutingContestant.create!(contestant: contestant_3, outing: outing_2)}

  it 'shows bachelorettes name, season number, and description' do 
    visit "/bachelorettes/#{bachelorette_1.id}"

    expect(page).to have_content(bachelorette_1.name)
    expect(page).to have_content(bachelorette_1.season_number)
    expect(page).to have_content(bachelorette_1.description)

    expect(page).to_not have_content(bachelorette_2.name)
    expect(page).to_not have_content(bachelorette_2.season_number)
    expect(page).to_not have_content(bachelorette_2.description)
  end 

  it 'has a link to the contestants show page that is tied to the bachelorette' do 
    visit "/bachelorettes/#{bachelorette_1.id}"

    click_link "#{bachelorette_1.name} Contestants"

    expect(current_path).to eq("/bachelorettes/#{bachelorette_1.id}/contestants")
  end

  it 'shows the average age of all of the contestants' do 
    visit "/bachelorettes/#{bachelorette_1.id}"

    expect(page).to have_content("Average Age Of All Contestants: 15.0")
  end
end