class CoolersController < ApplicationController
  def index
    @coolers = Cooler.all
  end

  def show
    @cooler = Cooler.find(params[:id])
  end

  def new
    @cooler = Cooler.new
  end

  def create
    @cooler = Cooler.new(cooler_params)
    if @cooler.save
      redirect_to cooler_path(@cooler), notice: 'Cooler was successfully created.'
    else
      render :new
    end
  end

  def edit
    @cooler = Cooler.find(params[:id])
  end

  def update
    @cooler = Cooler.find(params[:id])
    if @cooler.update(cooler_params)
      redirect_to cooler_path(@cooler), notice: 'Cooler was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cooler = Cooler.find(params[:id])
    @cooler.destroy
    redirect_to coolers_path, notice: 'Cooler was successfully destroyed.'
  end

  private

  def cooler_params
    params.require(:cooler).permit(:brand, :model, :socket, :noise_level, :max_tdp, :price, :form_factor, :rating, :image)
  end
end
