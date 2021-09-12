class Outing < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :date
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings
end
