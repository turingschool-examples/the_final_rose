require 'rails_helper'

RSpec.describe 'Bachelorettes Contestants Index Page' do 
    before do 
        @bachelorette = Bachelorette.create(name: 'Gwheniphyr Ruby', season_number: 80, season_description: 'the one at the haunted trailor park')
        @contestant1 = @bachelorette.contestants.create(name: 'Brad Guy', age: 29, hometown: 'Los Angeles')
        @contestant2 = @bachelorette.contestants.create(name: 'Tyler Dude', age: 31, hometown: 'New York')
        @contestant3 = @bachelorette.contestants.create(name: 'Steve Bro', age: 34, hometown: 'New Jersey')

        visit bachelorette_contestants_path(@bachelorette)
    end 

    describe 'display' do 
        it 'name, age and hometown of each contestant' do
            within "#contestants" do  
                expect(page).to have_content @contestant1.name
                expect(page).to have_content @contestant1.age
                expect(page).to have_content @contestant1.hometown
            end
        end 

        describe 'link to contestant show page' do 
            it 'each contestant name is a link to their respective show page' do 
                click_on @contestant1.name 
                expect(current_path).to eq contestant_path(@contestant1)
                expect(page).to have_content @contestant1.name
                expect(page).to_not have_content @contestant2.name 
            end 
        end 
    end
end 