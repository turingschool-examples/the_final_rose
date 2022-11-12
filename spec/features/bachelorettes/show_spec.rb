require 'rails_helper' 

RSpec.describe 'Bachelorette Show Page' do 
    before do 
        @bachelorette = Bachelorette.create(name: 'Gwheniphyr Ruby', season_number: 80, season_description: 'the one at the haunted trailor park')
        @contestant1 = @bachelorette.contestants.create(name: 'Brad Guy', age: 29, hometown: 'Los Angeles')
        @contestant2 = @bachelorette.contestants.create(name: 'Tyler Dude', age: 31, hometown: 'New York')
        @contestant3 = @bachelorette.contestants.create(name: 'Steve Bro', age: 34, hometown: 'New Jersey')
        @bachelorette_decoy = Bachelorette.create(name: 'Decoy Lady', season_number: 81, season_description: 'n/a')
        @contestant_decoy = @bachelorette_decoy.contestants.create(name: 'Decoy Man', age: 35, hometown: 'n/a')
        
        visit bachelorette_path(@bachelorette)
    end 

    describe 'display' do 
        it 'name, season number, description of season' do 
            expect(page).to have_content @bachelorette.name
            expect(page).to have_content @bachelorette.season_number
            expect(page).to have_content @bachelorette.season_description 
            expect(page).to_not have_content @bachelorette_decoy.name 
        end 

        describe 'link to bachelorette contestants' do 
            it 'directs to a bachelorette contestants index page' do 
                click_on 'Contestants'
                expect(current_path).to eq "/bachelorettes/#{@bachelorette.id}/contestants"
                within "#contestants" do 
                    expect(page).to have_content @contestant1.name
                    expect(page).to have_content @contestant2.name
                    expect(page).to have_content @contestant3.name
                    expect(page).to_not have_content @contestant_decoy.name 
                end
            end
        end

        it 'average age of all of the bachelorette contestants' do 
            expect(page).to have_content "Average Age of Contestants: 31.33"
        end 
    end 
end 