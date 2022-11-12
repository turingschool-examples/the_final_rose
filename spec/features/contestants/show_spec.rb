require 'rails_helper'

RSpec.describe 'Contestant Show Page' do 
    before do 
        @bachelorette = Bachelorette.create(name: 'Gwheniphyr Ruby', season_number: 80, season_description: 'the one at the haunted trailor park')
        @contestant1 = @bachelorette.contestants.create(name: 'Brad Guy', age: 29, hometown: 'Los Angeles')
        @contestant2 = @bachelorette.contestants.create(name: 'Tyler Dude', age: 31, hometown: 'New York')
        @contestant3 = @bachelorette.contestants.create(name: 'Steve Bro', age: 34, hometown: 'New Jersey')
        @outing1 = Outing.create(name: 'Face Planting', location: 'Mountain Peaks', date: '9/11/2032' )
        @outing2 = Outing.create(name: 'Truth or Dare', location: 'Troll Bridge', date: '9/13/2032' )
        @outing3 = Outing.create(name: 'Eating Contest', location: 'Cannibal Castle', date: '9/15/2032' )
        @outing_decoy = Outing.create(name: 'Decoy Outing', location: 'No place', date: 'No day' )

        ContestantOuting.create(contestant_id: @contestant1.id, outing_id: @outing1.id)
        ContestantOuting.create(contestant_id: @contestant2.id, outing_id: @outing1.id)
        
        ContestantOuting.create(contestant_id: @contestant2.id, outing_id: @outing2.id)
        ContestantOuting.create(contestant_id: @contestant3.id, outing_id: @outing2.id)
        
        ContestantOuting.create(contestant_id: @contestant3.id, outing_id: @outing3.id)
        ContestantOuting.create(contestant_id: @contestant1.id, outing_id: @outing3.id)

        visit "/contestants/#{@contestant1.id}"
    end 
    
    describe 'display' do 
        it 'name, season number and season description' do 
            expect(page).to have_content @contestant1.name
            expect(page).to have_content "Season 80: the one at the haunted trailor park"
        end 

        it 'list of all the outings the contestant was on' do 
            within "#outings" do 
                expect(page).to have_content 'Face Planting'
                expect(page).to_not have_content 'Truth or Dare'
                expect(page).to have_content 'Eating Contest'
            end
        end 

        describe 'link to Outing Show page' do 
            it 'outing name links to the respective outings show page' do 
                within "#outings" do 
                    click_on 'Face Planting'
                    expect(current_path).to eq "/outings/#{@outing1.id}"
                end
            end
        end
    end 
end 