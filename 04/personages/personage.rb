class Personage
	attr_accessor :name, :hp, :strength

	def initialize(name, hp, strength)
		@name = name
		@hp = hp
		@strength = strength
	end

	def hit(ennemy)
		if rand(0..10) == 2
			puts "Oops attack failed"
		else
			ennemy.beaten(rand(4..@strength))
		end
	end

	def beaten(value)
		@hp -= value
	end

	def heal
		@hp += rand(5..30)
	end

	def infos
		puts "#{@name}: #{@hp}"
	end
end