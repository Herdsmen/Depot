class AdminController < ApplicationController
before_filter :authorize_user

  def index
    @unshipped_orders=Order.where(:status=>false)
    @total_unshipped_orders=@unshipped_orders.count
  end
  
  def ship
    @order = Order.find(params[:id])
    @order.ship
    if @order.save
       Notifier.order_shipped(@order).deliver
      redirect_to admin_url, :notice=>"order: #{@order.id} has been shipped"
    else
      redirect_to store_url, :notice=>"failed to ship"
    end
  end

end
