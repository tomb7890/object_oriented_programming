require 'salestax'



puts"INPUT:\n\nOutput 1:\n\n"


s = Salestax.new 
s.read_input("input1.dat")
x=  s.report
puts "#{x}\n\n"


s = Salestax.new 
s.read_input("input2.dat")
x=  s.report
puts "#{x}\n\n"


s = Salestax.new 
s.read_input("input3.dat")
x=  s.report
puts "#{x}\n\n"










