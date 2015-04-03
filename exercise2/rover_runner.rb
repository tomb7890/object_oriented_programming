r = Rover.new(3,4,'N')

def main
  puts "Please enter the size of the grid"
  input <<  gets.chomp
  puts "Please enter the initial position and direction of a rover"
  r1 = Rover.new(x,y,heading)
  input << gets.chomp
  puts "Please enter a series of move and turn instructions for the first rover." 
  input << gets.chomp
  puts "Please enter the initial start position and header of rover #2."
  input << gets.chomp
  puts "Please enter the move and turn instructions for rover #2."
  input << gets.chomp                                 
end

main

