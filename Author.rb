class Author
  attr_accessor :name, :biography

  def initialize(name, biography, *all)
    @name, @biography = name, biography
  end

  def to_s
    [@name, @biography].join(',')
  end
end