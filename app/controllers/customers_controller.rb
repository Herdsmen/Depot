class CustomersController < ApplicationController
  #skip_before_filter :authorize_customer, :only=>[:new,:create]
  before_filter :authorize_user, :only=>[:destroy]
  before_filter :authorize_customer, :only=>[:index,:show,:edit,:update,:collect,:order]
  before_filter :authorize_vistor, :only=>[:new,:create]
  # GET /customers
  # GET /customers.xml
  def index
    @cart = current_cart  #为了在收藏页面添加商品进购物车时，购物车能显示
    customer=Customer.find_by_id(session[:user_id])
    @products = customer.products

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end
  
  
  def show_orders
    @cart = current_cart
    @customer = Customer.find(session[:user_id])
  end

  # GET /customers/show
  # GET /customers/1.xml
  def show
    @customer = Customer.find(session[:user_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/edit
  def edit
    @customer = Customer.find(session[:user_id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        session[:type]="Customer"
        session[:user_id]=@customer.id
        format.html { redirect_to customers_path }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to customers_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
  
  def collect
    @customer=Customer.find(session[:user_id])
    @customer.add_products_to_collection(params[:product_id])
    if @customer.save
		redirect_to customers_path
    else
		redirect_to(store_url, :notice=>"The product has been collected.")
    end
  end
  
  def remove_collection
    @customer=Customer.find(session[:user_id])
    @customer.remove_products_from_collection(params[:product_id])
    if @customer.save
    redirect_to customers_url
    else
      redirect_to(store_url, :notice=>"faile to remove collection")
    end
  end
  
  def show_comments
    
  end
  
end
