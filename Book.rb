class Book
  attr_accessor :title, :author

  def initialize(title, author, *all)
    @title, @author = title, author
  end

  def to_s
    [@title, @author].join(',')
  end
end