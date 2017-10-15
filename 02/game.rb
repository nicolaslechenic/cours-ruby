require "pry"
require_relative "scene"
require_relative "personages/personage"
require_relative "personages/human"
require_relative "personages/ghost"

puts "Nom de ton personnage"
hero = Human.new(gets.chomp.to_s)

puts "*"*30
puts "Début du jeu"
puts "*"*30

ennemies = [
	Ghost.new('BadBoo'),
	Ghost.new('BigBoo')
]

current_scene = Scene.new(hero, ennemies)

loop do
	max = ennemies.size - 1

  hero.hit(ennemies[rand(0..max)])
  current_scene.remove_ennemies

  ennemies.each { |ennemy| p "#{ennemy.name} - #{ennemy.hp}" }

  puts "Bravo #{hero.name}, tu gagnes" if current_scene.win?

  break if current_scene.is_finished?
  puts "-" * 10
end


# TODO : gets chomp / loop / array / delete_if