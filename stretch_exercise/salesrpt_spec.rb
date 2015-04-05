require_relative 'salestax'

describe "Salestax Totals"  do  

  it "should verify basic testing" do
    expect("5 5").to eql "5 5"
  end

  it "should compute example #1 totals correctly" do 
    s = Salestax.new 
    s.read_input("input1.dat")
    expected = 1.50
    expect(s.total_sales_tax).to eql expected 

    expected = 29.83
    expect(s.total).to eql expected 
  end

  it "should compute example #2 totals correctly" do 
    s = Salestax.new 
    s.read_input("input2.dat")
    expected = 7.65
    expect(s.total_sales_tax).to eql expected 

    expected=65.15
    expect(s.total).to eql expected 
  end

  it "should compute example #3 totals correctly" do 
    s = Salestax.new 
    s.read_input("input3.dat")
    expected = 6.70
    expect(s.total_sales_tax).to eql expected 

    expected = 74.68
    expect(s.total).to eql expected 
  end
end
