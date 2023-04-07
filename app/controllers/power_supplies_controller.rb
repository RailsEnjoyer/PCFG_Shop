class PowerSuppliesController < ApplicationController
  def index
    @power_supplies = PowerSupply.all
  end

  def show
    @power_supply = PowerSupply.find(params[:id])
  end

  def new
    @power_supply = PowerSupply.new
  end

  def create
    @power_supply = PowerSupply.new(power_supply_params)
    if @power_supply.save
      redirect_to @power_supply
    else
      render 'new'
    end
  end

  def edit
    @power_supply = PowerSupply.find(params[:id])
  end

  def update
    @power_supply = PowerSupply.find(params[:id])
    if @power_supply.update(power_supply_params)
      redirect_to @power_supply
    else
      render 'edit'
    end
  end

  def destroy
    @power_supply = PowerSupply.find(params[:id])
    @power_supply.destroy
    redirect_to power_supplies_path
  end

  private

  def power_supply_params
    params.require(:power_supply).permit(:brand, :model, :wattage, :price, :efficiency, :form_factor, :rating, :image)
  end
end
