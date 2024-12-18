class ProductController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items, only: [:index, :show]
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
      size = Size.find(size_id)
      order = current_order

      if @product.product_sizes.exists?(size_id: size_id)
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

        cart_item.price = @product.price
        cart_item.save
        redirect_to cart_path, notice: 'Product added to cart'
      end
    end
  end

  private
    def set_cart_items
      @cart_items = current_order.carts
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

end
