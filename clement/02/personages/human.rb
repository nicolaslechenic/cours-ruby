require_relative 'personage'

class Human < Personage
	def initialize(name)
		super(name, 100, 15)
	end
end