class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items
  before_action :set_order

  def new
    @payment = @order.build_payment
  end

  def create
    @payment = @order.build_payment(payment_params)

    ActiveRecord::Base.transaction do
      if @payment.save
        @order.update!(status: :completed)
        decrement_product_quantities
        redirect_to order_path(@order), notice: 'Order completed successfully.'
      else
        render :new
      end
    end
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end

    def set_cart_items
      @cart_items = current_order.carts
    end

    def decrement_product_quantities
      @order.carts.each do |cart|
        product_size = ProductSize.find_by(product_id: cart.product_id, size_id: cart.size_id)
        new_quantity = product_size.quantity - cart.quantity
        product_size.update!(quantity: new_quantity)
      end
    end

    def payment_params
      params.require(:payment).permit(:name, :details)
    end
end
