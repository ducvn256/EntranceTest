# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class ItemInReceipt
  attr_accessor:product
  attr_accessor:quantity
  attr_accessor:price
  
  def initialize(product,quantity,price)
    @product = product
    @quantity = quantity
    @price = price
  end
end
