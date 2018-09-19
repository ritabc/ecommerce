class ApplicationController < ActionController::Base
  # load_and_authorize_resource
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :cart_quantity
  before_action :authenticate_user!


  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def cart_quantity
    item_quantity = 0
    OrderItem.where(order_id: current_order.id).each do |oi|
      item_quantity += oi.quantity
    end
    item_quantity
  end

end
