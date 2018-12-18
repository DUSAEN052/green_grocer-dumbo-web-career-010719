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
    if coupons[:item] == item
      output[item + " W/COUPON"] = {
        :price => coupons[:cost],
        :clearance => info[:clearance],
        :count => 
      }
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
