class Author
  attr_accessor :name, :biography

  def initialize(name, biography, *all)
    @name, @biography = name, biography
  end
end