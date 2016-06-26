# my_car.rb

class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year

  def self.gas_mileage(distance, gas)
    distance.to_f/gas
  end

  def initialize(y, c, m)
    @year = y
    self.color = c
    self.model = m
    self.speed = 0
  end

  def accel(inc)
    self.speed += inc
  end

  def decel(dec)
    self.speed -= dec
  end

  def turn_off
    self.speed = 0
  end

  def spray_paint(c)
    self.color = c
  end

  def to_s
    "#{year} #{model} moving at #{speed} mph"
  end 
end

my_mazda = MyCar.new(2010, 'blue', 'mazda 3')
my_mazda.accel(20)
puts my_mazda
my_mazda.spray_paint('purple')
puts my_mazda
puts MyCar.gas_mileage(10, 5)
