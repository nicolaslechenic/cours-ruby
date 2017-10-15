require "pry"
require_relative "personages/personage"
require_relative "personages/human"
require_relative "personages/ghost"


hero = Human.new('Hero')
vilain = Ghost.new('BadBoo')


hero.hit(vilain)
hero.infos
vilain.infos


# TODO : Inheritance / super method / Gemfile / require_relative