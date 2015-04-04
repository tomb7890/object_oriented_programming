class Salestax
  def initialize
    @items = [] 
    @totaltax = 0 
  end

  def exempt?(s)
    # except books, food, and medical products
    if s=~ /.*(book|chocolate|pill).*/i
      true
    end
  end

  def read_input(filename)
    File.readlines(filename).each do |line|
      compute(line)
    end
  end
  
  def total_sales_tax
    @totaltax.round(2)
  end

  def total
    t = total_sales_tax
    @items.each do |item|
      t = t + item[:p]
    end
    t.round(2)
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

  def compute(s)
    # 10% on all goods, except books, food, 
    # and medical products

    s.gsub!(/\ at\ */, ": " )

    words = s.split(" ")
    price = words.last.to_f
    n = (words.size)-2 

    tax = 0
    taxp = 0 
    if !exempt?(s) 
      taxp = 10
    end

    if s=~ /imported/ 
      taxp += 5 
    end

    # taxp is now say 10 on a domestic CD
    # tax is taxp / 100.0 * price 
    if taxp 
      tax = taxp / 100.0 * price 
      tax = round_up(tax) 
    end
    @totaltax = @totaltax + tax.round(2)
    itemname = words[0..n].join(" ") 
    rc = ""
    rc << itemname  << " " << "%02.2f" % ( price + tax )  
    # store the item, its price, and its tax 
    stuff = { i: itemname, p: price, t: tax }
    @items.push(stuff)
    rc 
  end

  def report
    r = ''
    @items.each do |item| 
      stuff = item 
      itemname = stuff[:i]
      price = stuff[:p]
      if price > 0 then
        tax = stuff[:t]

        cost = "%02.2f" % ( price + tax )  
        r = r + "#{itemname} #{cost}\n"
      end       
    end
    r = r + "Sales Taxes: %02.2f \n" % total_sales_tax
    r = r + "Total: #{total}\n"
    return r
  end

end 
