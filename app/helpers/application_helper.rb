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
			
			content_tag(:ul, liTags)
		end 
	end
end
