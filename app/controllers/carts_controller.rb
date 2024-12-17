class CartsController < UsersController
  def show
    @order = current_order
    @cart_items = @order.carts.includes(:product, :size) if @order
  end

  def remove_from_cart
    cart_item = Cart.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart'
  end
end
