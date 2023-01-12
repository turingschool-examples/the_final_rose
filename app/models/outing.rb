class Outing <ApplicationRecord
  has_many :outing_contestants, dependent: :destroy
  has_many :contestants, through: :outing_contestants, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :location
  validates_presence_of :date
end