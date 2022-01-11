require 'rails_helper'

RSpec.describe 'outings show page' do
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

  it 'shows the outings name' do 
    visit "/outings/#{outing_1.id}"

    expect(page).to have_content(outing_1.name)
    expect(page).to_not have_content(outing_2.name)
  end

  it 'shows the outings location' do 
    visit "/outings/#{outing_1.id}"
    
    expect(page).to have_content(outing_1.location)
    expect(page).to_not have_content(outing_2.location)
  end

  it 'shows the outings date' do 
    visit "/outings/#{outing_1.id}"

    expect(page).to have_content(outing_1.date)
    expect(page).to_not have_content(outing_2.date)
  end

  it 'shows the number of contestants in an outing' do 
    visit "/outings/#{outing_1.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end

  it 'shows the names of the contestants involved' do 
    visit "/outings/#{outing_1.id}"

    expect(page).to have_content(contestant_1.name)
    expect(page).to have_content(contestant_2.name)

    expect(page).to_not have_content(contestant_3.name)
  end
end