# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Product
  attr_accessor:name,:productType,:price
  def initialize(name,type,price)
    @name = name
    @productType = type
    @price = price
  end
  
  # check whether apply sales tax for product
  def is_apply_sale_tax
    if (@productType == ProductType::BOOK or 
        @productType == ProductType::FOOD or 
        @productType == ProductType::MEDICAL)
      return false
    end
    return true
  end
  
  # check whether apply imported tax for product
  def is_apply_import_tax
    return @name.downcase.match("import") != nil
  end
  
    # get sales tax value of 1 item
  def sales_tax
    if (is_apply_sale_tax)
      return (@price.to_f * 0.1)
    end
    return 0
  end
  
  # get sales tax value of 1 item
  def import_tax
    if (is_apply_import_tax)
      return (@price.to_f * 0.05)
    end
    return 0
  end
  
  # calculate shelf price
  def shelf_price
    return (price.to_f + import_tax + sales_tax).round_to(2)
  end
end
