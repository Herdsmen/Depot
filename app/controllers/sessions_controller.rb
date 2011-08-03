class SessionsController < ApplicationController

  def new
  end

  def create
    if user=User.authenticate(params[:name],params[:password])
      type=type_for_actor(user.id)   
      session[:type]=type
      session[:user_id]=user.id
      redirect_to_home_according_to_type
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
  
  def redirect_to_home_according_to_type
    if session[:type]=="User"
      redirect_to admin_url
    else
      redirect_to customers_path
    end
  end
  
  def clear_user_session
    session[:type]=nil
    session[:user_id]=nil
    Cart.destroy(session[:cart_id]) unless session[:cart_id]==nil
    session[:cart_id] = nil
  end

end
