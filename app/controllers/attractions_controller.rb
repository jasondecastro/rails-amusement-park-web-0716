class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end

  def new
  end

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction])
    if @ride.save
      @ride.take_ride
      redirect_to user_path(current_user)
    end
  end

  def edit
  end
end