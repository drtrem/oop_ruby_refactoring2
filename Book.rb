class Book
	attr_accessor :title, :author
	
	def initialize(title: nil, author: nil)
		@title, @author = title, author
	end
end