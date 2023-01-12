class Bachelorette <ApplicationRecord
  has_many :contestants, dependent: :destroy
  has_many :outings, through: :contestants, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :season_number
end
