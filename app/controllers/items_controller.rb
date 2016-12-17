class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
<<<<<<< HEAD

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def destroy
  end

  private

=======
>>>>>>> 00262675e0bb3c0d7741c1c857f52bf19a96762f
end
