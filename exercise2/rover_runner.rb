require_relative 'rover'

def main
  rovers = []

  p = Plateau.new 
  # "Your program should accept 5 inputs with gets." 
  puts "Please enter the size of the grid"
  input = gets.chomp
  x,y = input.split(" ")
  p.set_plateau_size(x,y)

  puts "Please enter the initial start position and header of rover #1."
  input = gets.chomp
  x,y,v = input.split(" ")
  r = Rover.new(x.to_i, y.to_i, v)

  puts "Please enter the move and turn instructions for rover #1."
  input = gets.chomp
  r.set_instructions(input)
  rovers << r 
  
  puts "Please enter the initial start position and header of rover #2."
  input = gets.chomp
  x,y,v = input.split(" ")
  r = Rover.new(x.to_i, y.to_i, v)

  puts "Please enter the move and turn instructions for rover #2."
  input = gets.chomp                                 
  r.set_instructions(input)
  rovers << r 

  rovers.each do |r|
    puts r.run
  end
end

main

