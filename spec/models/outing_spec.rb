require 'rails_helper'

RSpec.describe Outing do
  it {should validate_presence_of :name}
  it {should validate_presence_of :location}
  it {should validate_presence_of :date}
  it {should have_many(:contestant_outings)}
  it {should have_many(:contestants).through(:contestant_outings)} 
end
