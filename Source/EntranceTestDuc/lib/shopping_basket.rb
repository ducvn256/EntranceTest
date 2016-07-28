# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class ShoppingBasket
  attr_accessor:listOfItem
  # init with empty data
  def initialize
    @listOfItem = Array.new
  end  
  
  # init with existing data
  def initialize data
    @listOfItem = data
  end
  
end
