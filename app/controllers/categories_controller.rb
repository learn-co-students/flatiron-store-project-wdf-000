class CategoriesController < ApplicationController

  def show
    # binding.pry
    @category = Category.find_by(id: params[:id])
  end

end
