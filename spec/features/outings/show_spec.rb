require 'rails_helper'

RSpec.describe 'Outing Show Page' do 
    before do 
        @bachelorette = Bachelorette.create(name: 'Gwheniphyr Ruby', season_number: 80, season_description: 'the one at the haunted trailor park')
        @contestant1 = @bachelorette.contestants.create(name: 'Brad Guy', age: 29, hometown: 'Los Angeles')
        @contestant2 = @bachelorette.contestants.create(name: 'Tyler Dude', age: 31, hometown: 'New York')
        @contestant3 = @bachelorette.contestants.create(name: 'Steve Bro', age: 34, hometown: 'New Jersey')
        @outing1 = Outing.create(name: 'Face Planting', location: 'Mountain Peaks', date: '9/11/2032' )
        @outing2 = Outing.create(name: 'Truth or Dare', location: 'Troll Bridge', date: '9/13/2032' )
        @outing3 = Outing.create(name: 'Eating Contest', location: 'Cannibal Castle', date: '9/15/2032' )

        ContestantOuting.create(contestant_id: @contestant1.id, outing_id: @outing1.id)
        ContestantOuting.create(contestant_id: @contestant2.id, outing_id: @outing1.id)
        
        ContestantOuting.create(contestant_id: @contestant2.id, outing_id: @outing2.id)
        ContestantOuting.create(contestant_id: @contestant3.id, outing_id: @outing2.id)
        
        ContestantOuting.create(contestant_id: @contestant3.id, outing_id: @outing3.id)
        ContestantOuting.create(contestant_id: @contestant1.id, outing_id: @outing3.id)

        visit "/outings/#{@outing1.id}"
    end 

    describe 'display' do 
        it 'name, location, date and total count of contestants that attended' do 
            expect(page).to have_content @outing1.name
            expect(page).to have_content "Location: #{@outing1.location}"
            expect(page).to have_content "Date: #{@outing1.date}"
            expect(page).to have_content "Count of Contestants: 2"
        end 

        it 'list of all contestants that attended that outing' do
            within "#contestants" do 
                expect(page).to have_content @contestant1.name
                expect(page).to have_content @contestant2.name
                expect(page).to_not have_content @contestant3.name
            end 
        end
    end 
end 