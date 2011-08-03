class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  #before_filter :authorize
  protect_from_forgery
  
  private
  
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
  protected
    
  def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice=>"Please log in"
      end
    end
    
    def authorize_user
      unless check_role_type=='User'
        if check_role_type=='Customer'
          redirect_to customers_path, :notice=>"You are not Admin "
        else
        redirect_to login_url, :notice=>"Please log in"
        end
      end
    end
    
    def authorize_vistor
      unless check_role_type=='Vistor'
        redirect_to store_url, :notice=>"You have already logged in "
      end
    end
    
    def authorize_customer
      unless check_role_type=='Customer'
        if check_role_type=='User'
          redirect_to users_path, :notice=>"You are not Customer "
        else
        redirect_to login_url, :notice=>"Please log in"
        end
      end
    end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = 
        "#{params [:locale]} translation not available"
        logger.error flash.now[:notice]
      end 
    end
  end
    
  def default_url_options
    { :locale => I18n.locale}
  end
  
    def check_role_type
    if defined? session
         if session[:type]=="Customer"
           return 'Customer'
         elsif session[:user_id]
           return 'User'
         else
           return 'Vistor'
         end         
    end
  end
  
end
