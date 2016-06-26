# good_dog.rb

class GoodDog
  attr_accessor :name, :height, :weight
 
  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} is #{height} tall and weighs #{weight}"
  end
end

sparky = GoodDog.new('Sparky', 6, 7)
puts sparky.info
sparky.change_info('Sparko', 60, 70)
puts sparky.info
