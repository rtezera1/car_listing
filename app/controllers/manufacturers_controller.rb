class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all 
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])    
  end

  def new 
    @manufacturer = Manufacturer.new
  end

  def create 
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_path, notice: 'Manufacturer Added to Listing'
    else
      render :new
    end
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
