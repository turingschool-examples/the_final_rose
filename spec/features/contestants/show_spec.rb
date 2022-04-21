require 'rails_helper'


RSpec.describe 'contestant show page' do 

	it 'shows the name, season, and description of contestant' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		bach2 = Bachelorette.create!(name: 'Susan', season_number: 13, description: 'another great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
		contest3 = bach1.contestants.create!(name: 'Mike', age: 30, hometown: 'Hawaii')
		contest4 = bach2.contestants.create!(name: 'Alex', age: 20, hometown: 'dont care')


		visit contestant_path(contest1.id)

		expect(page).to have_content(contest1.name)	
		expect(page).to_not have_content(contest2.name)

		expect(page).to have_content(bach1.season_number)
		expect(page).to have_content(bach1.description)		
		expect(page).to_not have_content(bach2.season_number)
		expect(page).to_not have_content(bach2.description)
	end


	it 'has outings the contestant went on and the outing name is a link to outing show page' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		outing1 = Outing.create!(name: 'Dinner')
		outing2 = Outing.create!(name: 'Movie')
		outing3 = Outing.create!(name: 'Leetcode problem')
		ContestantOuting.create!(contestant: contest1, outing: outing1)
		ContestantOuting.create!(contestant: contest1, outing: outing2)
		ContestantOuting.create!(contestant: contest1, outing: outing3)

		visit contestant_path(contest1.id)

		expect(page).to have_content('Dinner')
		expect(page).to have_content('Movie')
		expect(page).to have_content('Leetcode problem')

		click_on 'Dinner'
		expect(current_path).to eq outing_path(outing1.id)

	end
end