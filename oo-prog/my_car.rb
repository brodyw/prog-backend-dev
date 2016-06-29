# my_car.rb

module Liftable
  def lift
    puts 'This truck has been lifted'
  end
end

class Vehicle
  attr_accessor :year, :model, :color, :speed
  @@number_of_vehicles = 0
  def self.gas_mileage(distance, gas)
    distance.to_f/gas
  end

  def initialize(y, c, m)
    self.color = c
    self.speed = 0
    self.year = y
    self.model = m
    @@number_of_vehicles += 1
  end

  def accel(inc)
    self.speed += inc
  end

  def decel(dec)
    self.sped -= dec
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

  def self.num_vehicles
    @@number_of_vehicles
  end
end

class MyCar < Vehicle
  TYPE = 'car'.freeze
end

class MyTruck < Vehicle
  include Liftable
  TYPE = 'truck'.freeze
end

my_mazda = MyCar.new(2010, 'blue', 'mazda 3')
my_mazda.accel(20)
puts my_mazda
my_mazda.spray_paint('purple')
puts my_mazda
puts MyCar.gas_mileage(10, 5)
puts Vehicle.num_vehicles

my_ford = MyTruck.new(2009, 'black', 'Ford Trucky')
puts my_ford
puts my_ford.lift

#added a line of code to not lose bet to Branden
#added a second line of code again to not lose bet
