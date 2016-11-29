class Library
  ARRAYS_NAME = %w(author book reader order)

  def initialize
    @order, @book, @reader, @author = [], [], [], []
  end

  def load
    ARRAYS_NAME.each do |name|
      return unless File.exists?("data/#{name}.txt")
      File.open("data/#{name}.txt", 'r').each do |line|
        row = line.chomp.split(',')
        instance_eval("@#{name} << #{name.capitalize}.new(row[0], row[1], row[2], row[3], row[4])")
      end
    end
  end

  def save
    ARRAYS_NAME.each do |name|
      File.open("data/#{name}.txt", 'w') do |f|
        instance_eval("@#{name}.each do |obj|
          obj_to_s(obj, f)
        end")
      end
    end
  end

  def obj_to_s(obj, f)
    obj.instance_variables.map {|index| f.print "#{obj.instance_variable_get(index)},"}
    f.puts ''
  end

  def group_sort(param_sort)
   @order.group_by(&:"#{param_sort}").sort_by{|_, order| order.size}
  end

  def often_take_book_reader
    group_sort('reader').last[0]
  end

  def popular_book(number = 3)
    group_sort('book').last(number)
  end

  def most_popular_book
    popular_book[2][0]
  end

  def readers_three_most_popular_books
    popular_book.map {|array| array[1]}.flatten.map(&:reader).uniq.size
  end
end