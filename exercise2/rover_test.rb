require 'rover'

describe "Rover Tests"  do  
  it "should verify basic testing" do
    expect("5 5").to eql "5 5"
  end

  it "should instantiate a Rover" do
    r = Rover.new(1,3,'N')
  end

  it "should handle empty command string" do 
    r = Rover.new(3,3,'N')
    p = Plateau.new
    p.set_plateau_size( 5,5 )
    results = r.command("")
    expect(results).to eql "3 3 N"
  end 

  it "should respond to incremental commands" do 
    r = Rover.new(3,3,'N')
    p = Plateau.new
    p.set_plateau_size( 5,5 )
    results = r.command("LLLLM")
    expect(results).to eql "3 4 N"

    results = r.command("R")
    expect(results).to eql "3 4 E"

    results = r.command("L")
    expect(results).to eql "3 4 N"

    results = r.command("MM")
    expect(results).to eql "3 6 N"

    results = r.command("LM")
    expect(results).to eql "2 6 W"
  end 

  it "should handle test data example #1" do 
    r = Rover.new(1,2,'N')
    p = Plateau.new
    p.set_plateau_size( 5,5 )
    output = r.command("LMLMLMLMM")
    expect(output).to eql "1 3 N"
  end

  it "should handle test data  example #2 " do
    r = Rover.new(3,3,'E')
    p = Plateau.new
    p.set_plateau_size( 5,5 )
    output = r.command("MMRMMRMRRM")
    expect(output).to eql ("5 1 E")
  end

  # Your program should accept 5 inputs with gets .
  
end
