class CommentsController < ApplicationController
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end
  
  def create
    @product = Product.find(params[:comment][:product_id])
    @comment = @product.comments.create(:title => params[:comment][:title], 
                                        :comment => params[:comment][:comment],
                                        :user_id => params[:comment][:user_id])
    respond_to do |format|
      format.html { redirect_to( :controller => "products", :action => "show", :id => params[:comment][:product_id], :notice => 'Product was successfully created.')}
    end
  end
end
