class ItemsController < ApplicationController
  skip_filter :authenticate_user!

  def show
    @item = Item.find_by(id: params[:id])
  end
end
