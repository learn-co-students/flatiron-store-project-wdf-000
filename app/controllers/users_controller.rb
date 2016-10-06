class UsersController < ApplicationController
  def show
    session.clear
    redirect_to store_path
  end
end
