class ContestantsController < ApplicationController 
    def index 
        @bachelorette = Bachelorette.find_by(params[:id])
    end 

    def show 
        @contestant = Contestant.find(params[:id])
    end
end 