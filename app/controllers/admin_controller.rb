class AdminController < ApplicationController
  def index
    @total_orders=Orders=Order.count
  end

end
