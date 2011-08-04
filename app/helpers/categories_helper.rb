module CategoriesHelper 
	def treeDisplay(hashNode)
		if hashNode.nil? then return nil
		else
			liTags = nil
			
			hashNode.each do | key, value |
				liTag = link_to("#{ key.name }", edit_category_path(key), :title => "Reset name")
				
				# if session[:user_id]
					liTag += link_to("X", key, :confirm => "Are you sure?", :method => :delete, 
						:title => "Delete a node and its children", :class => "delete_button")
				# end
				
				unless value.nil? then liTag += treeDisplay(value) end
			
				if liTags.nil? then liTags = content_tag(:li, liTag)
				else liTags	+= content_tag(:li, liTag) end
			end
			
			content_tag(:ul, liTags)
		end 
	end
end
