require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :outing_contestants}
    it {should have_many :outings, through: :outing_contestants}
  end

  describe 'validations' do
    it {should validate_presance_of :name}
    it {should validate_presance_of :age}
    it {should validate_presance_of :hometown}
  end
end
