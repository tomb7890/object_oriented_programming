require_relative 'salestax'

# this file creates a report of three test files  
(1..3).each do |n| 
  puts "\nOutput %d:\n\n" % n 
  s = Salestax.new 
  text = s.report("input%d.dat" % n )
  puts "#{text}\n\n"
end 











