# Users Controller
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_authorization, only: [:edit, :update]
  before_action :set_user

  def show
  end

  def edit
  end
# User Controller
  def delete
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = 'Something went wrong. Please try again'
      render :edit
    end
  end

  private

  def check_authorization
    redirect_to root_url unless current_user.id == params[:id].to_i
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :avatar, :description)
    # params.require(:user).permit(:username, :description, :avatar)
    # params.require(:user).permit(:username, :description, :avatar)
  end
end
