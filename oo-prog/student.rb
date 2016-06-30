# student.rb

class Student
  attr_reader :name
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(s)
    grade > s.grade
  end

  protected

  attr_reader :grade
end
bob = Student.new('bob', 90)
joe = Student.new('joe', 95)
puts 'Well done!' if joe.better_grade_than?(bob)
