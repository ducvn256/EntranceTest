# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class ProductType
  def ProductType.add_item(key,value)
        @hash ||= {}
        @hash[key]=value
    end
    
    def ProductType.const_missing(key)
        @hash[key]
    end    
    
    def ProductType.each
        @hash.each {|key,value| yield(key,value)}
    end
    
    # Must be in FOOD, BOOK, MEDICAL, OTHER
    ProductType.add_item :FOOD, 1
    ProductType.add_item :BOOK, 2
    ProductType.add_item :MEDICAL, 3
    ProductType.add_item :OTHER, 4
end
