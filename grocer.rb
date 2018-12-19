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
  if coupons.length == 0
    return cart
  end
  output = {}
  
  cart.each do |item, info|
    coupons.each do |coupon|
      if coupon[:item] == item and coupon[:num] <= info[:count]
        if output[coupon[:item] + " W/COUPON"] == nil
          output[coupon[:item] + " W/COUPON"] = {
            :price => coupon[:cost],
            :clearance => info[:clearance],
            :count => 1
          }
        else
          output[coupon[:item] + " W/COUPON"][:count] += 1
        end
        cart[item][:count] -= coupon[:num]
        
      end
      output[item] = info
    end
  end

  output
end

def apply_clearance(cart)
  # code here
  
  cart.each do |item, info|
    if info[:clearance]
      info[:price] = (info[:price] * 0.8).round(2)
    end
  end
  
  cart
end

def checkout(cart, coupons)
  # code here
  total = 0
  consolidated = consolidate_cart(cart)
  couponned = apply_coupons(consolidated, coupons)
  cleared = apply_clearance(couponned)
  
  cleared.each do |item, info|
    total += info[:price] * info[:count]
  end
  
  if total > 100
    return total * 0.9
  end
  
  return total
  
end
