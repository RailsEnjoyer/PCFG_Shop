class ComponentsController < ApplicationController
  before_action :set_component, only: %i[update show destroy edit]

  def create 
    component = Component.create(component_params)

    redirect_to component_path(component), notice: 'Component successfully added!'
  end

  def update 
    @component.update(component_params)

    redirect_to component_path(@component), notice: 'Component successfully updated!'
  end

  def destroy
    @component.destroy

    redirect_to catalogue_path
  end

  def show
  end

  def index
    @components = Component.all
  end

  def new
    @component = Component.new 
  end

  def edit
  end

  private 

  def component_params
    params.require(:component).permit(:title, :country, :brand, :market_date, :size, :connectors, :guarantee, :complete_set,
    :rating, :weight, :price, :availability, :description, :user_id, :image)
  end

  def set_component
    @component = Component.find(params[:id])
  end
end
