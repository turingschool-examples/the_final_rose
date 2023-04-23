require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
    it {should belong_to :season}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_numericality_of :season_number}
  end

  describe 'instance methods' do
    before do
      test_data
    end
    it "#average_age" do
      expect(@bach1.average_age).to eq(25)
      expect(@bach2.average_age).to eq(40)
      expect(@bach3.average_age).to eq(55)
    end

    it "#contestant_hometowns" do
      expect(@bach1.contestant_hometowns).to eq("Loc 1, Loc 2, Loc 3")
      expect(@bach2.contestant_hometowns).to eq("Loc 4, Loc 5, Loc 6")
      expect(@bach3.contestant_hometowns).to eq("Loc 7, Loc 8, Loc 9")
    end
  end
end
