class Order
	attr_accessor :book, :reader, :date
	
	def initialize(book: nil, reader: nil, date: nil)
		@book, @reader, @date = book, reader, date
	end
end