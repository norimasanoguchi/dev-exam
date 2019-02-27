class EstatesController < ApplicationController
  def index
    @estates = Estate.all
  end
  
  def new
    @estate = Estate.new
    @estate.nearest_stations.build
  end
  
  def create
    @estate = Estate.new(estate_params)

    if @estate.save
      redirect_to( estates_path, notice:"登録しました")
    else
      render 'new'
    end
  end
  
  def show
    @estate = Estate.find(params[:id])
    @first_nearest_station = @estate.nearest_stations.first
    @second_nearest_station = @estate.nearest_stations.second
  end
  
  def edit
    @estate = Estate.find(params[:id])
    @estate.nearest_stations.build
  end
  
  def update
    @estate = Estate.find(params[:id])
    if @estate.update(estate_params)
      redirect_to( estates_path, notice:"編集しました")
    else
      render 'edit'
    end
  end
  
  def destroy
    @estate = Estate.find(params[:id])
    @estate.destroy
    redirect_to( estates_path, notice:"削除しました" )
  end
  
  private
  
    def estate_params
      params.require(:estate).permit(:name, :address, :rent, :age, :memo, nearest_stations_attributes: [:id, :line, :station_name, :distance_on_foot])
    end
  
end
