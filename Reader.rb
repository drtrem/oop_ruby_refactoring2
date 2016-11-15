class Reader
	attr_accessor :name, :email, :city, :street, :house
	
	def initialize(name: nil, email: nil, city: nil, street: nil, house: nil)
		@name, @email, @city, @street, @house = name, email, city, street, house
	end
end