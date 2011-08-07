module CategoriesHelper 
	#
	# Use to display the tree used to store the categories.
	# @param Hash(Category, Hash) hashNode
	# @return ActiveSupport::SafeBuffer
	#
	def treeDisplay(hashNode)
		if hashNode.nil? then return nil
		else
			liTags = nil
			
			hashNode.each do | key, value |				
				content = generateLinkBy key
				content += generateChildNodeBy value
			
				liTags = addLiTagTo content, liTags
			end
			
			content_tag(:ul, liTags)
		end 
	end
	
	#
	# Generate the relational operate link.
	# @param Category category
	# @return ActiveSupport::SafeBuffer
	#
	def generateLinkBy(category)
		editLink = link_to("#{ category.name }", edit_category_path(category), :title => "Reset name")
		
		# if session[:user_id]
		deleteLink = link_to("X", category, :confirm => "Are you sure?", :method => :delete, 
			:title => "Delete a node and its children", :class => "delete_button")
		# end
		
		editLink + deleteLink
	end
	
	#
	# if childnode is exists, display it recursively.
	#
	def generateChildNodeBy(hashCategory)
		if hashCategory.nil? then return nil
		else return treeDisplay(hashCategory) end
	end
	
	#
	# Add 'li' tag to content.
	# @param String content
	# @param ActiveSupport::SafeBuffer liTags
	# @return ActiveSupport::SafeBuffer
	#
	def addLiTagTo(content, liTags)
		if liTags.nil? then return content_tag(:li, content)
		else  return liTags	+= content_tag(:li, content) end
	end
end
