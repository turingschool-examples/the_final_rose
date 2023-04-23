class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings 
  
  validates_presence_of :name

  def count_contestants
    contestants.size
  end
end