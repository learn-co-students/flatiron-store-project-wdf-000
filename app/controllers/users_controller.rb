class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      redirect_to store_path, alert: "Access Denied"
    end
  end
end
