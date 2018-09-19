class ApplicationController < ActionController::Base
  # load_and_authorize_resource
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :cart_values
  before_action :authenticate_user!


  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def cart_values
    quantity_price_arr = []
    quantity_ttl = 0
    price_ttl = 0
    OrderItem.where(order_id: current_order.id).each do |oi|
      product = Product.find_by(:id => oi.product_id)
      quantity_ttl += oi.quantity
      price_ttl += (oi.quantity * product.price)
    end
    quantity_price_arr.push(quantity_ttl)
    quantity_price_arr.push(price_ttl)
    quantity_price_arr
  end

end
