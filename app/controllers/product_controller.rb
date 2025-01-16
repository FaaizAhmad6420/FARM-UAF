class ProductController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]
  # before_action :set_cart_items, only: [:index, :show]
  before_action :set_product, only: [:show, :add_to_cart]
  before_action :set_categories, only: [:show]

  def index
    @q = Product.ransack(params[:q])
    @pagy, @products = pagy(@q.result(distinct: true))
    @categories = Category.all
  end

  def show
    @sizes = Size.all
  end

  def add_to_cart
    size_id = params[:size_id]
    quantity = params[:quantity].to_i

    if size_id.present? && quantity > 0
      # size = Size.find(size_id)
      order = current_order

      product_size = @product.product_sizes.find_by(size_id: size_id)

      if product_size
        size = product_size.size
        size_multiplier = size.multiplier

        price_for_size = @product.price * size_multiplier

        cart_item = Cart.find_or_initialize_by(
          order_id: order.id,
          product: @product,
          size_id: size_id
        )

        if cart_item.persisted?
          cart_item.quantity += quantity
        else
          cart_item.quantity = quantity
        end

        cart_item.price = price_for_size
        cart_item.save
        redirect_to cart_path, notice: 'Product added to cart'
      end
    end
  end

  private
    # def set_cart_items
    #   @cart_items = current_order.carts
    # end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

end
