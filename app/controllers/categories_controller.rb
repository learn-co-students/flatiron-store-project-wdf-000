class CategoriesController < ApplicationController
  skip_filter :authenticate_user!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
  end
end
