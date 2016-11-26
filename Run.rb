require './library.rb'
require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'

library = Library.new
library.load
library.save

puts "Best reader: #{library.often_take_book_reader}"
puts "Most_popular_book: #{library.most_popular_book}"
puts "Ordered one of the three most popular books: #{library.readers_three_most_popular_books}"