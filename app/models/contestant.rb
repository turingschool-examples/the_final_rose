class Contestant < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  def season_number
    bachelorette.season_number
  end

  def season_description
    bachelorette.season_description
  end

  def all_outings
    self.outings.all
  end
end
