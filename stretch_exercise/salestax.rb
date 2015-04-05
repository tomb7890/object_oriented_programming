class Salestax
  def initialize
    @totaltax = 0 
    @totalprice = 0 
  end

  def exempt?(s)
    # except books, food, and medical products
    if s=~ /.*(book|chocolate|pill).*/i
      true
    end
  end

  def process_file(filename)
    File.readlines(filename).each do |line|
      item = itemname_from_receipt_line(line)
      price = price_from_receipt_line(line)
      tax = tax_on_item(item, price)
      @totaltax = @totaltax + tax
      @totalprice = @totalprice + price
    end
  end

  def total_sales_tax
    @totaltax.round(2)
  end

  def total
    (@totaltax + @totalprice).round(2)
  end

  def round_up(tax)
    tax_cents = (tax * 100).round
    mod = tax_cents % 5 
    if ( mod > 0 ) then
      tax_cents = ( tax_cents / 5 ) * 5
      tax_cents = tax_cents + 5 
      tax = tax_cents / 100.0 
    end
    tax
  end

  def tax_on_item(name, price) 
    tax = 0
    taxp = 0 
    if !exempt?(name) then
      taxp = 10
    end
    if name  =~ /imported/ 
      taxp += 5 
    end
    if taxp > 0 then
      tax = taxp / 100.0 * price 
      tax = round_up(tax) 
    end
    tax
  end

  def itemname_from_receipt_line(l)
    words = l.split(" ")
    n = (words.size)-2 
    itemname = words[0..n].join(" ") 
  end

  def price_from_receipt_line(l)
    words = l.split(" ")
    price = words.last.to_f
  end

  def replace_colons_with_ats(s)
    # the input data has 'at' usage, whereas
    # expected output has colons seperating items from price
    s.gsub!(/\ at\ */, ": " )
  end

  def format_output_string(item, price, tax)
    rc = ""
    rc << item  << " " << "%02.2f" % ( price + tax )  
    rc = replace_colons_with_ats( rc )
    rc
  end

  def compute1(line)
    item = itemname_from_receipt_line(line)
    price = price_from_receipt_line(line)
    tax = tax_on_item(item, price)
    format_output_string(item, price, tax)
  end
  
  def report(filename)
    r = ''
    File.readlines(filename).each do |line|
      item = itemname_from_receipt_line(line)
      price = price_from_receipt_line(line)
      tax = tax_on_item(item, price)
      
      if price > 0 then
        cost = "%02.2f" % ( price + tax )  
        r = r + "#{item} #{cost}\n"
        @totaltax = @totaltax + tax
        @totalprice = @totalprice + price
      end       
    end

    r <<  "Sales Taxes: %02.2f \n" % total_sales_tax
    r << "Total: #{total}\n"
  end
end 
