class MainController < ApplicationController
    before_action :set_component, only: %i[update show destroy edit]

  def create 

    component = Component.create(component_params)

    redirect_to compoenents_path @component
  end

  def update 
    @component.update(component_params)

    redirect_to component_path(@component)
  end

  def index
  end

  def destroy
    @component.destroy

    redirect_to components_path
  end

  def show
  end

  def new
    @component = Component.new 
  end

  def edit
  end

  def catalogue
    @components = Component.all
  end

  private 

  def component_params
    params.require(:component).permit(:title, :country, :brand, :market_date, :size, :connectors, :guarantee, :complete_set,
    :rating, :weight, :price, :availability, :description, :user_id)
  end

  def set_component
    @component = Component.find(params[:id])
  end
end