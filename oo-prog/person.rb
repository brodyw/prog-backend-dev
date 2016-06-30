# person.rb

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    change_name(n)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(n)
    change_name(n)
  end

  def equal?(n)
    puts n.name
    name.downcase.strip.eql?(n.name.downcase.strip)
  end

  def to_s
    name
  end

  private

  def change_name(n)
    n_array = n.split(' ')
    self.first_name = n_array[0]
    self.last_name = n_array[1]
  end

end

bob = Person.new('Robert')
puts "here #{bob.name}"
puts bob.first_name
puts bob.last_name
bob.last_name = 'Smith'
puts bob.name
rob = Person.new('Robert Smith')
puts rob.equal?(bob)
puts bob
