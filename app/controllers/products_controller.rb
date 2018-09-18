class ProductsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @nyt = NytBestseller.new
    @nyt_json = []
    JSON.parse(@nyt.get_list)["results"]["books"].each do |book|
      @nyt_json.push(book)
    end
    # @current_user = current_user
  end

  def show

  end
end
