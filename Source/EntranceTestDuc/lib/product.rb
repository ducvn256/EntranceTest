# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Product
  attr_accessor:name,:productType
  def initialize(name,type)
    @name = name
    @productType = type
  end
end
