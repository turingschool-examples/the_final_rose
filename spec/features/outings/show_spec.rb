require 'rails_helper'


RSpec.describe 'outing show page' do 

	it 'has outingsattributes' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		bach2 = Bachelorette.create!(name: 'Not Amy', season_number: 12, description: 'great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		contest2 = bach1.contestants.create!(name: 'Jim', age: 30, hometown: 'Denver')
		contest3 = bach1.contestants.create!(name: 'Alex', age: 30, hometown: 'Denver')
		contest4 = bach2.contestants.create!(name: 'James', age: 30, hometown: 'Denver')
		outing1 = Outing.create!(name: 'Dinner', location: 'Restaurant A', outing_date: '02/21/22')
		outing2 = Outing.create!(name: 'Movie', location: 'movie theater', outing_date: '03/22/22')
		ContestantOuting.create!(contestant: contest1, outing: outing1)
		ContestantOuting.create!(contestant: contest2, outing: outing1)
		ContestantOuting.create!(contestant: contest3, outing: outing1)
		ContestantOuting.create!(contestant: contest4, outing: outing2)

		visit outing_path(outing1.id)

		expect(page).to have_content('Dinner')
		expect(page).to have_content('Restaurant A')
		expect(page).to have_content('02/21/22')
		expect(page).to have_content('Count of Contestants: 3')
		expect(page).to have_content('Contestant(s): Bob, Jim, Alex')


		expect(page).to_not have_content('Movie')
		expect(page).to_not have_content('movie theater')
		expect(page).to_not have_content('03/22/22')
		expect(page).to_not have_content('Count of Contestants: 1')
		expect(page).to_not have_content('Contestant(s): James')
		


	end
end