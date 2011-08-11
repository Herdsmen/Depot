class SessionsController < ApplicationController

  def new
  end

  def create
    if user=User.authenticate(params[:name],params[:password])
      type=type_for_actor(user.id)   
      session[:type]=type
      session[:user_id]=user.id
      link_current_cart_to_customer if type=='Customer'
      
	  redirect_to_original_uri_or_role_home
    else
      redirect_to login_url, :alert=>"Invalid user/password combination"
    end
  end

  def destroy
    clear_user_session
    redirect_to store_url, :notice=>"Logged out"
  end
  
  private
  
  def type_for_actor(id)
    user=User.find(id)
    if user.type.nil?
      return "User"
    else
      return "Customer"
    end
  end
  
  def redirect_to_original_uri_or_role_home
      uri = session[:original_uri]
      session[:original_uri] = nil  
      if uri == nil
        redirect_to_home_according_to_type
      else
        redirect_to uri
      end
  end
  
  def redirect_to_home_according_to_type
    if session[:type]=="User"
		redirect_to admin_url
    else
		redirect_to :controller => "customers", :action => "show", :id => session[:user_id]
    end
  end
  
  def clear_user_session
    session[:type]=nil
    session[:user_id]=nil
    session[:cart_id] = nil
  end
  
  def link_current_cart_to_customer
    customer_cart=find_customer_cart
    customer_cart=combine_current_cart_to(customer_cart)
    set_current_cart(customer_cart)
  end
  
  def find_customer_cart
    customer_cart=Cart.find_by_customer_id(session[:user_id])
    unless customer_cart
      customer_cart=Cart.new
      customer_cart.customer=Customer.find(session[:user_id])
      customer_cart.save 
    end
    return customer_cart
  end
  
  def combine_current_cart_to(customer_cart)
    current_cart.line_items.each do |item|
      item.cart_id = nil
      customer_cart.add_to_line_items(item)
    end
      if customer_cart.save
        return customer_cart
      else
         flash.now[:notice] = 
        "#{params [:locale]} database error"
        logger.error flash.now[:notice]
      end
  end
  
  def set_current_cart(customer_cart)
    Cart.destroy(session[:cart_id])
    session[:cart_id] = customer_cart.id
  end
    

end
