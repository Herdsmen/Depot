class CommentsController < ApplicationController
  before_filter :authorize_customer
  def create
    @product = Product.find(params[:comment][:product_id])
    @comment = @product.comments.create(:title => params[:comment][:title], 
                                        :comment => params[:comment][:comment],
                                        :user_id => session[:user_id])
    respond_to do |format|
      format.html { redirect_to( :controller => "products", :action => "show", :id => params[:comment][:product_id], :notice => 'Product was successfully created.')}
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if (@comment.user_id == session[:user_id])

    respond_to do |format|
      format.html { redirect_to( :controller => "products", :action => "show", :id => params[:product_id]) }
      format.xml  { head :ok }
    end
  end
end
