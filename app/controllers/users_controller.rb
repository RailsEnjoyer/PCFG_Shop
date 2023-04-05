class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    if @user.save
      redirect_to main_path
    else
      flash.now[:alert] = 'wrong input parameters'
      render :new
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to main_path
    else
      flash.now[:alert] = 'error while updating'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session.delete(:user_id)

    redirect_to main_path
  end

  private 

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end
