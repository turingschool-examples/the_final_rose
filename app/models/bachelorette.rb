class Bachelorette <ApplicationRecord
  has_many :contestants
  
  def contestants_average_age
    contestants.average(:age).round(2)
  end 

  def contestant_hometowns
    contestants.distinct.pluck(:hometown).join(', ')
  end 
end
