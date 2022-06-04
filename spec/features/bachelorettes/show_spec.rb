require 'rails_helper'

RSpec.describe 'Bachelorettes show page' do
  before :each do
    @tiff = Bachelorette.create!(name: "Tiffany", season_number: 4)

    @brad = @tiff.contestants.create!(name: "Brad", age: 23, hometown: "Newport")
    @tim = @tiff.contestants.create!(name: "Tim", age: 25, hometown: "Bakersfield")
    @joe = @tiff.contestants.create!(name: "Joe", age: 22, hometown: "HB")

    @picnic = Outing.create!(name: "Picnic", location: "Park", date: '2021-04-07')
    @movie = Outing.create!(name: "Movie Date", location: "Drive-in", date: '2021-04-20')
    @dinner = Outing.create!(name: "Dinner Date", location: "Omlette du Fromage", date: '2021-04-28')

    @co_1 = ContestantOuting.create!(contestant_id: @brad.id, outing_id: @picnic.id)
    @co_2 = ContestantOuting.create!(contestant_id: @tim.id, outing_id: @picnic.id)
    @co_3 = ContestantOuting.create!(contestant_id: @tim.id, outing_id: @movie.id)
    @co_4 = ContestantOuting.create!(contestant_id: @joe.id, outing_id: @movie.id)
    @co_5 = ContestantOuting.create!(contestant_id: @joe.id, outing_id: @dinner.id)
  end

  it '' do


  end
end