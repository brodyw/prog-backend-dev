# student.rb

class Student

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def name
    @name
  end

  def better_grade_than?(s)
    grade > s.grade
  end

  protected
  
  def grade
    @grade
  end

end

bob = Student.new('bob', 90)
joe = Student.new('joe', 95)
puts "Well done!" if joe.better_grade_than?(bob)
