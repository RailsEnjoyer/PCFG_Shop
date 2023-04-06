class RigsController < ApplicationController
  def index
    @rigs = Rig.all
  end

  def show
    @rig = Rig.find(params[:id])
  end

  def new
    @rig = Rig.new
  end

  def create
    @rig = Rig.new(rig_params)
    if @rig.save
      redirect_to @rig
    else
      render 'new'
    end
  end

  def edit
    @rig = Rig.find(params[:id])
  end

  def update
    @rig = Rig.find(params[:id])
    if @rig.update(rig_params)
      redirect_to @rig
    else
      render 'edit'
    end
  end

  def destroy
    @rig = Rig.find(params[:id])
    @rig.destroy
    redirect_to rams_path
  end

  private

  def rig_params
    params.require(:rig).permit(:brand, :model, :form_factor, :drive_bays, :price, :image, :rating)
  end
end
