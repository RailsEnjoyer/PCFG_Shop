class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.create_cart
      redirect_to root_path, notice: 'Registrated'
    else
      flash.now[:alert] = 'wrong input'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'User deleted'
  end

  private 

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :address, :phone, :age, :country, :payment_method, :image)
  end
end
