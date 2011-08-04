class Category < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
	validates :parent, :presence => true
	validates :layer, :numericality => true
	
	has_and_belongs_to_many :products
	
	class << self 
		#
		# Return the columns
		# @return Array 
		# 
		def getNames
			names = Array[]
			
			all.each do | category |
				names << category.name
			end
			
			names
		end
		
		#
		# return all child nodes of a node.
		# @param Integer id
		# @return Array
		#
		private
		def childNodesByID(id) 
			Category.where({ :parent => id })
		end
		
		#
		# build a hash tree by id
		# @param Integer id
		# @return Hash include the child nodes of the node's id is 'id'
		#
		def generateHashTree(id)
			nodes = childNodesByID id
			
			if nodes.empty? then return nil
			else
				h = Hash.new 
				
				nodes.each do | node |
					h[node] = generateHashTree(node.id)
				end
				
				return h
			end
		end
		
		#
		# get all the id of the nodes that is the childnode of the node id is  'id'
		# @param Integer id
		# @return Array
		#
		public
		def getAllNodeIdUnderNode(id)
			idArray = Array.new
		  
			idArray << id
		  
			childNodes = childNodesByID id
		  
			unless childNodes.empty? then 
				tmpArray = Array.new
				childNodes.each do | node |
					tmpArray = tmpArray | getAllNodeIdUnderNode(node.id)
				end
		    
				idArray = idArray | tmpArray
			end
      
			return idArray
		end
		
		
		#
		# @return Hash a hash tree include all nodes.
		#
		public
		def tree
			return generateHashTree Category.where(:name => 'ROOT_NODE').first.id
		end

		#
		#
		#
		private
		def deleteNodeByID(nodeID) 
			Category.where({ :id => nodeID }).first.destroy
		end
		
		#
		# Destroy the node that id is equial to 'nodeID', and its childnodes.
		#
		public
		def destroyNodeByID(nodeID)
			childNodesArray = childNodesByID(nodeID)
				
			unless childNodesArray.empty? then 
				childNodesArray.each do | node |
					deleteNodeByID node.id
				end
			end
			
			deleteNodeByID nodeID
		end
	end 
end
