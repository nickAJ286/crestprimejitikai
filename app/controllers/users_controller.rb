class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :building_id, :room, :family_name, :first_name,:role_id)
  end

  def check_role
    if current_user.role_id != 2 && current_user.id != 1
      redirect_to root_path
    end
  end
end
