require "pry"
require_relative "scene"
require_relative "personages/personage"
require_relative "personages/human"
require_relative "personages/ghost"

puts 'Nom de ton personnage'
hero = Human.new(gets.chomp.to_s)

puts '*' * 30
puts 'Début du jeu'
puts '*' * 30

ennemies =
  [
    Ghost.new('BadBoo'),
    Ghost.new('BigBoo')
  ]

current_scene = Scene.new(hero, ennemies)

loop do
  max = ennemies.size - 1

  hero.hit(ennemies[rand(0..max)])
  current_scene.remove_ennemies

  puts "#{hero.name} - #{hero.hp}"
  ennemies.each do |ennemy|
    ennemy.hit(hero)
    puts "#{ennemy.name} - #{ennemy.hp}"
  end

  puts "Bravo #{hero.name}, tu gagnes" if current_scene.win?
  puts "Oops #{hero.name}, tu perds" if current_scene.loose?

  break if current_scene.is_finished?
  puts '-' * 10
end

# TODO : if else (miss) & ternary /