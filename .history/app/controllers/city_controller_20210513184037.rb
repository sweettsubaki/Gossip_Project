class CityController < ApplicationController
  def index
    
  end

  def show
    @city = City.find(params[:id])
    @gossips_select_by_id = Gossip.where(user_id:User.where(city_name:@city.id))
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
