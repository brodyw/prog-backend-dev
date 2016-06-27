# good_dog.rb

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def public_disc
    "My human age is #{self.human_years}"
  end

  protected
  def human_years
    age / DOG_YEARS
  end
end

puppy = GoodDog.new('Puppy', 7)
puts puppy.public_disc

