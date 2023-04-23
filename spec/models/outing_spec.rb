require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'instance methods' do
      before do
        test_data
      end

      it "#count_contestants" do
        expect(@outing1.count_contestants).to eq(3)

        @outing1.contestant_outings.create!(contestant_id: @cont5.id)
        @outing1.reload

        expect(@outing1.count_contestants).to eq(4)
      end
  end
end