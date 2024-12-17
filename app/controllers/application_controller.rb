class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend

  def current_order
    Order.find_or_create_by(user_id: current_user.id, status: 'cart')
  end



  def set_cart_items
    @cart_items = current_order.carts
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
    end
end
