class HikesController < ApplicationController

  def index
    @hikes = Hike.all
  end

  def show
    @hike = Hike.find(params[:id])
  end

  def new
    @hike = Hike.new
  end

  def create
    @hike = Hike.new(hike_params)
    if @hike.save
      redirect_to hikes_path
    else
      render :new
    end
  end

  def edit
    @hike = Hike.find(params[:id])
  end

  def update
    @hike = Hike.find(params[:id])
    if @hike.update(hike_params)
      redirect_to hikes_path
    else
      render :edit
    end
  end 

  private

  def hike_params
    params.require(:hike).permit(:name, :location)
  end

end
