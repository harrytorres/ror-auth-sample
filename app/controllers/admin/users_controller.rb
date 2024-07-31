class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all
  end

  def show
    @user = User.find_puid(param[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "User updated"
      else
        flash[:error] = "Failed to update user"
      end
      redirect_to admin_users_path
  end

  private

   def user_params
      params.require(:user).permit(:admin)
    end

    def admin_user
      redirect_to(root_url) unless current_user.has_role? :admin
    end
end
