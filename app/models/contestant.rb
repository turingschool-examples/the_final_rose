class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :outing_contestants, dependent: :destroy
  has_many :outings, through: :outing_contestants, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
end
