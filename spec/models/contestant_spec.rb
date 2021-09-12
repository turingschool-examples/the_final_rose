require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should belong_to :bachelorette}
    it {should have_many :contestant_outings}
    it {should have_many(:outings).through(:contestant_outings)}
  end

  it 'has the season number of its bachelorette' do
    bachelorette = Bachelorette.create!(name: "Hannah", season_number: 7, season_description: "A good season")
    contestant = bachelorette.contestants.create!(name: "Louie", age: 25, hometown: "Denver")

    expect(contestant.season_number).to eq(bachelorette.season_number)
  end

  it 'has the season description of its bachelorette' do
    bachelorette = Bachelorette.create!(name: "Hannah", season_number: 7, season_description: "A good season")
    contestant = bachelorette.contestants.create!(name: "Louie", age: 25, hometown: "Denver")

    expect(contestant.season_description).to eq(bachelorette.season_description)
  end

  it 'has the name of the outing this contestant has been on' do
    bachelorette = Bachelorette.create!(name: "Hannah", season_number: 7, season_description: "A good season")
    contestant = bachelorette.contestants.create!(name: "Louie", age: 25, hometown: "Denver")
    outing_1 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")
    outing_2 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")

    expect(contestant.all_outings).to eq([outing_1, outing_2])
  end
end
