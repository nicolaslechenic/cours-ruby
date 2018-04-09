require_relative 'personage'

class Ghost < Personage
	def initialize(name)
		super(name, 110, 10)
	end
end