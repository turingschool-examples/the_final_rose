require 'rails_helper'

RSpec.describe Season, type: :model do
  describe "relationships" do
    it {should have_one :bachelorette}
  end
  
  describe "validations" do
    it {should validate_presence_of :description}
  end
end