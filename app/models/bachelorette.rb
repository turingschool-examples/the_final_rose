class Bachelorette < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :season_number
  validates_presence_of :season_description
  has_many :contestants
end
