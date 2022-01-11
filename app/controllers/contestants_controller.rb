class ContestantsController < ApplicationController 
  def show 
    @contestant = Contestant.find(params[:contestant_id])
    @season = Bachelorette.find(@contestant.bachelorette.id)  
  end
end