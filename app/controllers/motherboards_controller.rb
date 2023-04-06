class MotherboardsController < ApplicationController
  def index
    @motherboards = Motherboard.all
  end

  def show
    @motherboard = Motherboard.find(params[:id])
  end

  def new
    @motherboard = Motherboard.new
  end

  def create
    @motherboard = Motherboard.new(motherboard_params)
    if @motherboard.save
      redirect_to motherboard_path(@motherboard)
    else
      render :new
    end
  end

  def edit
    @motherboard = Motherboard.find(params[:id])
  end

  def update
    @motherboard = Motherboard.find(params[:id])
    if @motherboard.update(motherboard_params)
      redirect_to motherboard_path(@motherboard)
    else
      render :edit
    end
  end

  def destroy
    @motherboard = Motherboard.find(params[:id])
    @motherboard.destroy
    redirect_to motherboards_path
  end

  private

  def motherboard_params
    params.require(:motherboard).permit(:brand, :price, :form_factor, :model, :chipset, :memory_slots, :max_memory, :memory_type, :socket, :compatible_cpu)
  end
end
