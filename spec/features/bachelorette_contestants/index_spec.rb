require 'rails_helper'

RSpec.describe 'bachelorette contestants show page' do
  let!(:bachelorette_1) {Bachelorette.create!(name: "Wonder Woman", season_number: 1, description: "Funny Season")}
  let!(:bachelorette_2) {Bachelorette.create!(name: "Cat Woman", season_number: 2, description: "Awkward Season")}

  let!(:contestant_1) {bachelorette_1.contestants.create!(name: "Jerry", age: 10, hometown: "Florida Gulf")}
  let!(:contestant_2) {bachelorette_1.contestants.create!(name: "Layne", age: 20, hometown: "Florida Gulf")}
  let!(:contestant_3) {bachelorette_2.contestants.create!(name: "Zakk", age: 300, hometown: "Hyrule")}

  let!(:outing_1) {Outing.create!(name: "Concert", location: "Oriental Theater", date: "June 10th, 1992")}
  let!(:outing_2) {Outing.create!(name: "NAMM", location: "Anneheim", date: "May 1st, 2022")}

  let!(:outing_contestants_1) {OutingContestant.create!(contestant: contestant_1, outing: outing_1)}
  let!(:outing_contestants_2) {OutingContestant.create!(contestant: contestant_2, outing: outing_1)}
  let!(:outing_contestants_3) {OutingContestant.create!(contestant: contestant_3, outing: outing_2)}
  it 'lists the contestants names from a current season' do 
    visit "/bachelorettes/#{bachelorette_1.id}/contestants"

    expect(page).to have_content(contestant_1.name)
    expect(page).to have_content(contestant_2.name)

    expect(page).to_not have_content(contestant_3.name)
  end
  
  it 'lists the contestants age from a current season' do 
    visit "/bachelorettes/#{bachelorette_1.id}/contestants"

    expect(page).to have_content(contestant_1.age)
    expect(page).to have_content(contestant_2.age)

    expect(page).to_not have_content(contestant_3.age)
  end

  it 'lists the contestants hometown from a current season' do 
    visit "/bachelorettes/#{bachelorette_1.id}/contestants"

    expect(page).to have_content(contestant_1.hometown)
    expect(page).to have_content(contestant_2.hometown)

    expect(page).to_not have_content(contestant_3.hometown)
  end

  it 'has a link to the contestants show page' do 
    visit "/bachelorettes/#{bachelorette_1.id}/contestants"

    click_link "#{contestant_1.name}"

    expect(current_path).to eq("/contestants/#{contestant_1.id}")
  end

  it 'shows a unique list of hometowns for all contestants' do 
    visit "/bachelorettes/#{bachelorette_1.id}/contestants"

    expect(page).to have_content(contestant_1.hometown)
    expect(page).to_not have_content(contestant_3.hometown)
  end
end