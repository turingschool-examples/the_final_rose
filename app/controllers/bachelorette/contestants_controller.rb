class Bachelorette::ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:id])
    # require "pry"; binding.pry
  end
end
