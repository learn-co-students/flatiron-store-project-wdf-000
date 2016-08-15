class CategoriesController < ApplicationController

  def show
    @user = current_user
    @category = Category.find(params[:id])
  end


end
