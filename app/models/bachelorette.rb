class Bachelorette <ApplicationRecord
  has_many :contestants
  
  def contestants_average_age
    contestants.average(:age).round(2)
  end 
end
