require 'rails_helper'

RSpec.describe Bachelorette, type: :model do

  let!(:bachelorette_1) {Bachelorette.create!(name: "Wonder Woman", season_number: 1, description: "Funny Season")}
  let!(:bachelorette_2) {Bachelorette.create!(name: "Cat Woman", season_number: 2, description: "Awkward Season")}

  let!(:contestant_1) {bachelorette_1.contestants.create!(name: "Jerry", age: 10, hometown: "Florida Gulf")}
  let!(:contestant_2) {bachelorette_1.contestants.create!(name: "Layne", age: 20, hometown: "Florida Gulf")}
  let!(:contestant_3) {bachelorette_2.contestants.create!(name: "Zakk", age: 30, hometown: "Pacific Gulf")}
  let!(:contestant_4) {bachelorette_1.contestants.create!(name: "Batman", age: 30, hometown: "Seattle")}

  let!(:outing_1) {Outing.create!(name: "Concert", location: "Oriental Theater", date: "June 10th, 1992")}
  let!(:outing_2) {Outing.create!(name: "NAMM", location: "Anneheim", date: "May 1st, 2022")}

  let!(:outing_contestants_1) {OutingContestant.create!(contestant: contestant_1, outing: outing_1)}
  let!(:outing_contestants_2) {OutingContestant.create!(contestant: contestant_2, outing: outing_1)}
  let!(:outing_contestants_3) {OutingContestant.create!(contestant: contestant_3, outing: outing_2)}
 
  describe 'relationships' do
    it {should have_many :contestants}

    it 'can find the average age of all contestants on show' do 
      expect(bachelorette_1.average_contestants_age).to eq(20.0)
    end

    it 'returns a unique list of contestant hometowns' do 
      expect(bachelorette_1.unique_hometowns_list).to eq(["Florida Gulf", "Seattle"])
    end
  end
end
