require 'rails_helper'

RSpec.describe 'bachelorette contestants index page' do 

	it 'displays the contestsants info of a bachelorette' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		bach2 = Bachelorette.create!(name: 'Susan', season_number: 13, description: 'another great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
		contest3 = bach1.contestants.create!(name: 'Mike', age: 30, hometown: 'Hawaii')
		contest4 = bach2.contestants.create!(name: 'Alex', age: 20, hometown: 'dont care')


		visit bachelorette_contestants_path(bach1.id)

		expect(page).to have_content(contest1.name)
		expect(page).to have_content(contest1.age)
		expect(page).to have_content(contest1.hometown)
		expect(page).to have_content(contest2.name)
		expect(page).to have_content(contest2.age)
		expect(page).to have_content(contest2.hometown)
		expect(page).to have_content(contest3.name)
		expect(page).to have_content(contest3.age)
		expect(page).to have_content(contest3.hometown)		
		expect(page).to_not have_content(contest4.name)
		expect(page).to_not have_content(contest4.age)
		expect(page).to_not have_content(contest4.hometown)
	end

	it 'displays unique hometowns of contestants' do 
		bach1 = Bachelorette.create!(name: 'Amy', season_number: 12, description: 'great season!')
		contest1 = bach1.contestants.create!(name: 'Bob', age: 30, hometown: 'Denver')
		contest2 = bach1.contestants.create!(name: 'Jim', age: 32, hometown: 'NYC')
		contest3 = bach1.contestants.create!(name: 'Mike', age: 30, hometown: 'Hawaii')
		contest4 = bach1.contestants.create!(name: 'Mike2', age: 30, hometown: 'Hawaii')


		visit bachelorette_contestants_path(bach1.id)
		within('#hometowns') do 
			expect(page).to have_content("These Contestants are from these hometowns: Denver, Hawaii, NYC")
			expect(page).to have_content('Hawaii', count:1)
		end
	end
end 