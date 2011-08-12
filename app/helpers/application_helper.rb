module ApplicationHelper
	def hidden_div_if(condition,attributes={},&block)
		if condition
			attributes["style"]="display: none"
		end
		content_tag("div",attributes,&block)
	end
  
	def sideCategoriesDisplay(hashNode)
		if hashNode.nil? then return nil
		else
			liTags = nil
			
			hashNode.each do | key, value |
				liTag = link_to("#{ key.name }", {:controller => "store", :action => "index", :category => key.id}, :title => "GoTo")
				
				unless value.nil? then liTag += sideCategoriesDisplay value end
			
				if liTags.nil? then liTags = content_tag(:li, liTag)
				else liTags	+= content_tag(:li, liTag) end
			end
			
			content_tag(:ul, liTags, :class => "list")
		end 
	end
	
	def addButtonTo(product, type)
		case type
		when :addToCartButton then
			return addToCartButton product
		when :collectButton then
			return collectButton product
		when :removeCollectButton then
			return removeCollectButton product
		end
	end
	
	def addToCartButton(product)
		button_to "Add to Cart", 
			line_items_path(:product_id => product), 
			{ :remote => true, :disabled => @is_user, :class => "image_submit" }
	end
	
	def collectButton(product)
		button_to "Collect",
			{ :controller => "customers", :action=> "collect", :product_id => product.id}, 
			{ :disabled => @is_user, :class => "image_submit" }
	end
	
	def removeCollectButton(product)
		button_to "Remove", 
			{ :controller => "customers", :action => "remove_collection", :product_id => product },
			{ :class => "image_submit" }
	end
end
