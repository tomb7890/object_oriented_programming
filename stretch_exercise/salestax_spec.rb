require 'salestax'

describe "Salestax Tests"  do  

  before(:all) do
    @s = Salestax.new
  end

  it "should verify basic testing" do
    expect("5 5").to eql "5 5"
  end

  it "should calculate books" do 
    input = "1 book at 12.49"
    expected = "1 book: 12.49"
    expect(@s.compute(input)).to eql expected 
  end

  it "should calculate domestic CDs" do 
    input = "1 music CD at 14.99"
    expected = "1 music CD: 16.49"
    expect(@s.compute(input)).to eql expected 
  end

  it "should calculate  chocolate bars" do 
    input = "1 chocolate bar at 0.85"
    expected = "1 chocolate bar: 0.85"
    expect(@s.compute(input)).to eql expected 
  end

  it "should calculate imported food" do
    input = "1 imported box of chocolates at 10.00"
    expected = "1 imported box of chocolates: 10.50"
    expect(@s.compute(input)).to eql expected 
  end
end
