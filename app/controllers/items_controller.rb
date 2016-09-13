class ItemsController < ApplicationController
  skip_filter :authenticate_user!
end
