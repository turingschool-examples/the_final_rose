require 'rails_helper'

RSpec.describe 'bachelorettes show page' do 
	it 'displays bachelorette info' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		bach2 = Bachelorette.create!(name: 'Susan', season_number: 13, description: 'another great season!')


		visit bachelorette_path(bach1.id)
	
		expect(page).to have_content(bach1.name)
		expect(page).to have_content(bach1.season_number)
		expect(page).to have_content(bach1.description)		
		expect(page).to_not have_content(bach2.name)
		expect(page).to_not have_content(bach2.season_number)
		expect(page).to_not have_content(bach2.description)
	end

	it 'has a link to the bachelorette contestants index page' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		bach2 = Bachelorette.create!(name: 'Susan', season_number: 13, description: 'another great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
		contest3 = bach1.contestants.create!(name: 'Mike', age: 30, hometown: 'Hawaii')
		contest4 = bach2.contestants.create!(name: 'Alex', age: 20, hometown: 'dont care')

		visit bachelorette_path(bach1.id)
		click_on 'Show Contestants'

		expect(current_path).to eq bachelorette_contestants_path(bach1.id)

		expect(page).to have_content(contest1.name)
		expect(page).to have_content(contest2.name)
		expect(page).to have_content(contest3.name)
		expect(page).to_not have_content(contest4.name)
	end 


	it 'shows the average age of contestants of a bachelorette' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		bach2 = Bachelorette.create!(name: 'Susan', season_number: 13, description: 'another great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
		contest3 = bach1.contestants.create!(name: 'Mike', age: 31, hometown: 'Hawaii')
		contest4 = bach2.contestants.create!(name: 'Alex', age: 20, hometown: 'dont care')


		visit bachelorette_path(bach1.id)
		
		expect(page).to have_content("Average Age of Contestants: 31.0")
	end
end