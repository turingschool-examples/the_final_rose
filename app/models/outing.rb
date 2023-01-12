class Outing <ApplicationRecord
  has_many :outing_contestants
  has_many :contestants, through: :outing_contestants

  validates_presence_of :title
  validates_presence_of :location
  validates_presence_of :date
end