class Bachelorette <ApplicationRecord
  has_many :contestants
  has_many :outings, through: :contestants

  validates_presence_of :name
  validates_presence_of :season_number
end
