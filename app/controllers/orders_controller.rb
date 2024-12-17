class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items

  def index
    @orders = current_user.orders.where(status: 'completed').includes(:products)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
    def set_cart_items
      @cart_items = current_order.carts
    end
end
