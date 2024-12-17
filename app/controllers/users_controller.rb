class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items

  private
    def set_cart_items
      @cart_items = current_order.carts
    end
end
