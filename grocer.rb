def consolidate_cart(cart)
  # code here
  output = {}
  
  cart.each do |item, info|
    if output.key?(item)
      output[item][:count] += 1
    else
      output[item] = info
      output[item][:count] = 1
    end
  end
  
  return output
end

def apply_coupons(cart, coupons)
  # code here
  output = {}
  
  cart.each do |item, info|
    if coupons[:item] == item and coupons[:num] <= info[:count]
      output[item + " W/COUPON"] = {
        :price => coupons[:cost],
        :clearance => info[:clearance],
        :count => info[:count] / coupons[:num]
      }
      coupons[:num] -= info[:count]
    else
      output[item] = info
    end
  end
  
  output
end

def apply_clearance(cart)
  # code here
  
  cart.each do |item, info|
    if info[:clearance]
      info[:price] = info[:price] * 0.8
    end
  end
  
  cart
end

def checkout(cart, coupons)
  # code here
  total = 0
  apply_coupons(cart, coupons)
  apply_clearance(cart)
  
  cart.each do |item, info|
    total += info[:price]
  end
  
  if total > 100
    return total * 0.9
  end
  return total
  
end
