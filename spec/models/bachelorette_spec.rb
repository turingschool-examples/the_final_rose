require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
    it {should have_many :outings, through: :contestants}
  end

  describe 'validations' do
    it {should validate_presance_of :name}
    it {should validate_presance_of :season_number}
  end
end
