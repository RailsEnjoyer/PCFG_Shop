class RamsController < ApplicationController
  def index
    @rams = Ram.all
  end

  def show
    @ram = Ram.find(params[:id])
  end

  def new
    @ram = Ram.new
  end

  def create
    @ram = Ram.new(ram_params)
    if @ram.save
      redirect_to @ram
    else
      render 'new'
    end
  end

  def edit
    @ram = Ram.find(params[:id])
  end

  def update
    @ram = Ram.find(params[:id])
    if @ram.update(ram_params)
      redirect_to @ram
    else
      render 'edit'
    end
  end

  def destroy
    @ram = Ram.find(params[:id])
    @ram.destroy
    redirect_to rams_path
  end

  private

  def ram_params
    params.require(:ram).permit(:brand, :model, :memory, :memory_speed, :price, :memory_type, :timings, :voltage, :image, :rating)
  end
end
