class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date, *all)
    @book, @reader, @date = book, reader, date
  end

  def to_s
    [@book, @reader, @date].join(',')
  end
end