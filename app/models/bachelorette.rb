class Bachelorette < ApplicationRecord
  has_many :contestants
  
  def average_contestants_age
    contestants.average(:age).round.to_f
  end

  def unique_hometowns_list
    contestants.distinct(:hometown).pluck(:hometown)
  end
end
