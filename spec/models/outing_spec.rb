require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :contestant_outings}
    it { should have_many(:contestants).through(:contestant_outings)}
  end
end