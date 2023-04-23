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
end
