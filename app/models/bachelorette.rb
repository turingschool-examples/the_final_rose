class Bachelorette <ApplicationRecord
  has_many :contestants
  belongs_to :season
  
  validates_presence_of :name
  validates_numericality_of :season_number

  def average_age
    contestants.average("age")
  end
end
