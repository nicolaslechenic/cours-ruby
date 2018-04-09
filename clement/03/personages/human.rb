require_relative 'personage'

class Human < Personage
  def initialize(name)
    super(name, 280, 15)
  end
end