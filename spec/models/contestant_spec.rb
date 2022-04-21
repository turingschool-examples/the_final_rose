require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :contestant_outings}
    it {should have_many(:outings).through(:contestant_outings)}
  end

  describe 'class methods' do 
    describe '#average_age' do 
      it 'returns the average age of contestants' do 
        bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
        contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
        contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
        contest3 = bach1.contestants.create!(name: 'Mike', age: 31, hometown: 'Hawaii')

        expect(Contestant.average_age).to eq 31.0
      end
    end

    describe '#unique_hometowns' do 
      it 'returns unique hometowns of contestants' do 
          bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
          contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
          contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
          contest3 = bach1.contestants.create!(name: 'Mike', age: 30, hometown: 'Hawaii')
          contest4 = bach1.contestants.create!(name: 'Mike2', age: 30, hometown: 'Hawaii')

          expect(Contestant.unique_hometowns).to eq(["Hawaii", "Denver", "NYC"])
      end
    end
  end
end
