class SsdsController < ApplicationController
  def index
    @ssds = Ssd.all
  end

  def show
    @ssd = Ssd.find(params[:id])
  end

  def new
    @ssd = Ssd.new
  end

  def create
    @ssd = Ssd.new(ssd_params)
    if @ssd.save
      redirect_to @ssd
    else
      render :new
    end
  end

  def edit
    @ssd = Ssd.find(params[:id])
  end

  def update
    @ssd = Ssd.find(params[:id])
    if @ssd.update(ssd_params)
      redirect_to @ssd
    else
      render :edit
    end
  end

  def destroy
    @ssd = Ssd.find(params[:id])
    @ssd.destroy
    redirect_to ssds_path
  end

  private

  def ssd_params
    params.require(:ssd).permit(:capacity, :type, :brand, :price, :compatibility, :model, :interface, :form_factor, :read_speed, :write_speed, :compatible_interface, :rating, :image)
  end
end
