class Personage
	attr_accessor :name, :hp, :strength

	def initialize(name, hp, strength)
		@name = name
		@hp = hp
		@strength = strength
	end

	def hit(ennemy)
		shot_value = rand(3..@strength)

		ennemy.beaten(shot_value)
	end

	def beaten(value)
		@hp -= value
	end

	def infos
		puts "#{@name}: #{@hp}"
	end
end