class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
end
