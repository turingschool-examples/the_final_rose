require 'rails_helper'

RSpec.describe 'contestant index page,' do
  before :all do
    @bachelorette_1 = Bachelorette.create!(name: "Clare Crawley", season_number: 16)
    @contestant_1 = @bachelorette_1.contestants.create!(name: "Ed Waisbrot", age: 36, hometown: "Miami")
    @contestant_2 = @bachelorette_1.contestants.create!(name: "Ivan Hall", age: 28, hometown: "Dallas")
    @contestant_3 = @bachelorette_1.contestants.create!(name: "Bennett Jordan", age: 36, hometown: "Atlanta")

    visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
  end

  it 'displays contestant attributes' do
    within('#attributes') do
      save_and_open_page
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content(@contestant_3.name)
    end
  end
end
