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
  puts "Choose your action"
  puts "1 - Heal me"
  ennemies.each_with_index do |ennemy, index|
    puts "#{index + 2} - Beat #{ennemy.name}"
  end

  action = gets.chomp.to_i

  if action == 1
    hero.heal
  else
    hero.hit(ennemies[action - 2])
  end

  current_scene.remove_ennemies

  puts "#{hero.name} - #{hero.hp}"
  ennemies.each do |ennemy|
  	ennemy.hit(hero)
  	puts "#{ennemy.name} - #{ennemy.hp}"
  end

  puts "Bravo #{hero.name}, tu gagnes" if current_scene.win?
  puts "Oops #{hero.name}, tu perds" if current_scene.loose?

  break if current_scene.is_finished?
  puts "-" * 10
end


# TODO : if else (miss) & ternary /