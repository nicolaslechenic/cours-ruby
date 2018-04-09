class Scene
  attr_accessor :hero, :ennemies

  def initialize(hero, ennemies)
    @hero = hero
    @ennemies = ennemies
  end

  def remove_ennemies
    @ennemies.delete_if do |ennemy|
      ennemy.hp <= 0
    end
  end

  def is_finished?
    loose? || win?
  end

  def loose?
    @hero.hp <= 0
  end

  def win?
    @ennemies.size == 0
  end
end
