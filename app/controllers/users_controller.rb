class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def show
    if current_user.id == params[:id].to_i
      @user = current_user
      @reviews = current_user.reviews
    else
      @user = User.find(params[:id])
      @reviews = @user.reviews
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
