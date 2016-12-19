class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def destroy
    @item = Item.find(params[:id])
  end

  private
  def item_params

    params.require(:item).permit(:title, :inventory, :price, :description)
  end
end
