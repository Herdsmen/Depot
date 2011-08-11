class ProductsController < ApplicationController
  before_filter :authorize_user, :except => [:search, :show, :rating]
  before_filter :authorize_customer, :only => [:rating]

  # GET /products
  # GET /products.xml
  def index
    @products = Product.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.recent.limit(10).all
    @users = Comment.get_users(@comments) if @comments
    @comment_length = @product.comments.length

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

	# POST /products
	# POST /products.xml
	def create
		@product = Product.new(params[:product])
		@product.heat = 0
		
		# @params = params[:product]
		# @content = String.new
		
		# @params.to_hash.each do | key, value |
			# @content += "#{ key } => #{ value } ; "
		# end
	
		respond_to do |format|
			if @product.save
				format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
				# format.html { redirect_to(@product, :notice => "params class => #{ @params.class } content is #{ @content }") }
				format.xml  { render :xml => @product, :status => :created, :location => @product }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
			end
		end
	end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
	def who_bought
		@product = Product.find(params[:id])
		respond_to do | format |
			format.atom
			format.xml { render :xml => @product }
		end
	end
	
	def search
		@keys = params.to_hash
		
		@search = Product.search params[:search]
		@products = @search.all
		
		@cart = current_cart
		@is_user = (check_role_type=='User')
	end
	
	def rating
	  @product = Product.find(params[:product_id])
	  user = User.find_by_id(session[:user_id])
	  @product.rate_it( params[:rating],user)
	  @comment = Comment.new
    @comments = @product.comments.recent.limit(10).all
    @users = Comment.get_users(@comments) if @comments
    @comment_length = @product.comments.length

    respond_to do |format|
      format.html { redirect_to( :controller => "products", :action => "show", :id => params[:product_id], :notice => 'Product was successfully rated.')}
    end
	end
end
