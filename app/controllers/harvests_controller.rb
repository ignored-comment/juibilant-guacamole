class HarvestsController < ApplicationController

  def destroy
    plant = Plant.find(params[:plant])
    plot = Plot.find(params[:plot])
    Harvest.where(plant: plant, plot: plot).destroy_all
    redirect_to '/plots'
  end
end
