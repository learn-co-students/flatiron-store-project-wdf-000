class CategoriesController < ApplicationController

  def show
    # binding.pry
    @category = Category.find_by(params[:id])
  end


  def index
    @categories = Category.all
  end

  
  private

    def category_params
      params.require(:category).permit(:title)
    end

end
