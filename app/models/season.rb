class Season < ApplicationRecord
  has_many :bachelorettes
  
  validates_presence_of :description
end