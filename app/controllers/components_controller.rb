class ComponentsController < ApplicationController

  def create 
    component = Component.create(
      title: params[:component][:title],
      country: params[:component][:country],
      brand: params[:component][:brand],
      market_date: params[:component][:market_date],
      size: params[:component][:size],
      connectors: params[:component][:connectors],
      guarantee: params[:component][:guarantee],
      complete_set: params[:component][:complete_set],
      rating: params[:component][:rating],
      weight: params[:component][:weight],
      price: params[:component][:price],
      availability: params[:component][:availability],
      description: params[:component][:description],
      user_id: params[:component][:user_id]
    )

    redirect_to component_path(component)
  end

  def update 
    @component = Component.find(params[:id])
    @component.update(
      title: params[:component][:title],
      country: params[:component][:country],
      brand: params[:component][:brand],
      market_date: params[:component][:market_date],
      size: params[:component][:size],
      connectors: params[:component][:connectors],
      guarantee: params[:component][:guarantee],
      complete_set: params[:component][:complete_set],
      rating: params[:component][:rating],
      weight: params[:component][:weight],
      price: params[:component][:price],
      availability: params[:component][:availability],
      description: params[:component][:description],
      user_id: params[:component][:user_id]
    )
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy
  end

  def show
    @component = Component.find(params[:id])
  end

  def index
    @components = Component.all
  end

  def new
  end
end
