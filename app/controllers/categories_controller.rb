class CategoriesController < ApplicationController	
	# GET /categories
	# GET /categories.xml
	def index
		@categories = Category.all

		@return = Category.tree
		# @return = treeDisplay Category.tree
		
		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @categories }
		end
	end

	# GET /categories/1
	# GET /categories/1.xml
	def show
		begin
			@category = Category.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to categories_url, :notice => "Record Not Found"
		else 
			respond_to do |format|
				format.html # show.html.erb
				format.xml  { render :xml => @category }
			end
		end
	end

	# GET /categories/new
	# GET /categories/new.xml
	def new
		@category = Category.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @category }
		end
	end

	# GET /categories/1/edit
	def edit
		begin
			@category = Category.find(params[:id])

		rescue ActiveRecord::RecordNotFound
			redirect_to categories_url, :notice => "Record Not Found"
		end
	end

	# POST /categories
	# POST /categories.xml
	def create
		@category = Category.new(params[:category])
		
		# parentNode = params[:category][:parent]
		
		# content = String.new
		# parentNode.each do | key, value| 
			# content += "#{ key } => #{value} ; " 
		# end 
		
		parentNode = Category.where({ :name => params[:category][:parent] }).first
		@category.parent = parentNode.id
		@category.layer = parentNode.layer + 1
		
		respond_to do |format|
			if @category.save
				# format.html { redirect_to(@category, :notice => "#{parentNode.class} => #{parentNode}") }
				# format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
				format.html { redirect_to(categories_url, :notice => 'Category was successfully created.') }
				format.xml  { render :xml => @category, :status => :created, :location => @category }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /categories/1
	# PUT /categories/1.xml
	def update
		@category = Category.find(params[:id])

		# Category.resetParentName(@category.name, params[:category].to_hash["name"])
		
		respond_to do |format|
			if @category.update_attributes(params[:category])
				format.html { redirect_to(categories_url, :notice => 'Category was successfully updated.') }
				# format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
				# format.html { redirect_to(@category, :notice => params[:category].to_hash["name"]) }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /categories/1
	# DELETE /categories/1.xml
	def destroy
		@category = Category.find(params[:id])
		Category.destroyNodeByID(@category.id)
		
		
		# @category.destroy

		respond_to do | format |
			format.html { redirect_to(categories_url) }
			format.xml  { head :ok }
		end
	end
end
