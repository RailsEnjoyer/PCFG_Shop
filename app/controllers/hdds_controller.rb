class HddsController < ApplicationController
  def index
    @hdds = Hdd.all
  end

  def show
    @hdd = Hdd.find(params[:id])
  end

  def new
    @hdd = Hdd.new
  end

  def create
    @hdd = Hdd.new(hdd_params)
    if @hdd.save
      redirect_to @hdd
    else
      render :new
    end
  end

  def edit
    @hdd = Hdd.find(params[:id])
  end

  def update
    @hdd = Hdd.find(params[:id])
    if @hdd.update(hdd_params)
      redirect_to @hdd
    else
      render :edit
    end
  end

  def destroy
    @hdd = Hdd.find(params[:id])
    @hdd.destroy
    redirect_to hdds_path
  end

  private

  def hdd_params
    params.require(:hdd).permit(:capacity, :type, :brand, :price, :compatibility, :model, :interface, :form_factor, :rpm, :compatible_interface, :speed, :rating, :image)
  end
end
