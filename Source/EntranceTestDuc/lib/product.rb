# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Product
  attr_accessor:name,:productType
  def initialize(name,type)
    @name = name
    @productType = type
  end
  
  # check whether apply sales tax for product
  def is_apply_sale_tax
    if (@productType == "BOOK" or 
        @productType == "FOOD" or 
        @productType == "MEDICAL")
      return false
    end
    return true
  end
  
  # check whether apply imported tax for product
  def is_apply_import_tax
    
  end
end
