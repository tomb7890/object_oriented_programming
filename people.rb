class Person 
  def initialize(name)
    @name = name 
  end
  def greet
    puts "Hi, my name is #{@name}" 
  end
end 

class Student < Person
  def learn 
    puts "I get it!"
  end
end


class Instructor < Person
  def teach 
    puts "Everything in Ruby is an object"
  end
end 


chris = Instructor.new("Chris")
chris.greet

student = Student.new("Christina")
student.greet
