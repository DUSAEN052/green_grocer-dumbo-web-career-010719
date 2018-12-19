def consolidate_cart(cart)
  # code here
  output = {}
  
  cart.each do |item|
    item.each do |key, value|
      if output.key?(key)
        output[key][:count] += 1
      else
        output[key] = value
        output[key].merge!({:count => 1})
      end
    end
  end
  
  return output
end

def apply_coupons(cart, coupons)
  # code here
  output = {}

  cart.each do |item, info|
    
    coupons.each do |coupon|
      if coupon[:item] == item and coupon[:num] <= info[:count]
        output[item + " W/COUPON"] = {
          :price => coupon[:cost],
          :clearance => info[:clearance],
          :count => info[:count] / coupon[:num]
        }
        cart[item][:count] -= info[:count]
      end

      if cart[item][:count] >= 0
        output[item] = info
      end
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
  con = consolidate_cart(cart)
  apply_coupons(con, coupons)
  apply_clearance(con)
  
  cart.each do |item, info|
    total += info[:price]
  end
  
  if total > 100
    return total * 0.9
  end
  return total
  
end
