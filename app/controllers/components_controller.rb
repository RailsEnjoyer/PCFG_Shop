class ComponentsController < ApplicationController
  def create 
    Component.create(
      title: params[:component][:title],
      body: params[:component][:body],
      user_id: params[:component][:user_id]
    )
    redirect_to '/'
  end

  def update 
    @component = Component.find(params[:id])
    @component.update(
      title: params[:component][:title],
      body: params[:component][:body],
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
end
