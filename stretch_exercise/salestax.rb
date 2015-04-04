class Salestax
  def exempt?(s)
    if s=~ /(book|chocolate|pill)/i
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

    if !exempt?(s) 
      price = price * 1.10
      price = price.round(2)
    end

    if s=~ /imported/ 
      price = price * 1.05
    end

    z = words[0..n].join(" ") 
    z << " " << "%02.2f" % price  
  end
end 
