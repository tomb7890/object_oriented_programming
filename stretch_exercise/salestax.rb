class Salestax
  def exempt?(s)
    if s=~ /.*(book|chocolate|pill).*/i
      true
    end
  end

  def compute(s)
    # except books, food, and medical products

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

      def fixup(tax)
        tax_cents = (tax * 100).round
        mod = tax_cents % 5 
        if ( mod > 0 ) then
          tax_cents = ( tax_cents / 5 ) * 5
          tax_cents = tax_cents + 5 
          tax = tax_cents / 100.0 
        end
        tax
      end

      tax = fixup(tax) 
    end

    price += tax

    z = words[0..n].join(" ") 
    z << " " << "%02.2f" % price  
  end
end 
