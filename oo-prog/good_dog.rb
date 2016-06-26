# good_dog.rb

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a* DOG_YEARS
  end

  def to_s
    puts "My name is #{name} and I am #{age} dog years old"
  end
end

puts GoodDog.new('Sparky', 7)
