# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class ItemInReceipt
  attr_accessor:product
  attr_accessor:quantity
 
  def initialize(product,quantity)
    @product = product
    @quantity = quantity
  end
  
  def total
    return (@product.price.to_f + import_tax + sales_tax) * @quantity.to_f
  end
end
