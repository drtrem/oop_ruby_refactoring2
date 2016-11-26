class Library
	attr_accessor :orders, :books, :readers, :authors

	def initialize
		@orders, @books, @readers, @authors = [], [], [], []
	end
	
	def open_file(file_name, &block)
		return unless File.exists?("data/#{file_name}.txt")
		f = File.open("data/#{file_name}.txt", 'r')
		f.each do |line| 
			@row = line.chomp.split(',')
			yield
		end
	end
	
	def save_file(file_name, array, &block)
		@f = File.open("data/#{file_name}.txt", 'w')
		array.each do |line|
			@line = line
			yield
		end
	end
	
	def load
		open_file('authors'){@authors << Author.new(name: @row[0], biography: @row[1])}
		open_file('readers'){@readers << Reader.new(name: @row[0], email: @row[1], city: @row[2], street: @row[3], house: @row[4])}
		open_file('orders'){@orders << Order.new(book: @row[0], reader: @row[1], date: @row[2])}
		open_file('books'){@books << Book.new(title: @row[0], author: @row[1])}
	end
	
	def save
		save_file('authors', @authors){@f.puts [@line.name, @line.biography].join(',')}
		save_file('readers', @readers){@f.puts [@line.name, @line.email, @line.city, @line.street, @line.house].join(',')}
		save_file('orders', @orders){@f.puts [@line.book, @line.reader, @line.date].join(',')}
		save_file('books', @books){@f.puts [@line.title, @line.author].join(',')}
	end
	
	def often_take_book_reader
		@orders.group_by {|order| order.reader}.sort_by {|reader, order| order.size}.last[0]
	end
	
	def popular_book(number = 3)
		@orders.group_by {|order| order.book}.sort_by {|book, order| order.size}.last(number)
	end
	
	def most_popular_book
		popular_book[2][0]
	end
	
	def readers_three_most_popular_books
		popular_book.map {|array| array[1]}.flatten.map {|order| order.reader}.uniq.size
	end
end