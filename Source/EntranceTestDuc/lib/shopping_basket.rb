# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'csv'

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
  
  # add 1 item to cart
  def add_item item
    if (@listOfItem != nil)
      @listOfItem.push item
    else
      puts "@listOfItem is null, so can't add an item to this"
    end
    
  end
  
  # get 1 item from cart
  def get_item name
    if (@listOfItem)
      @listOfItem.select do |item|
          item.product.name == name
      end.first
    else
      puts "@listOfItem is null, so can't get an item from this"
    end
  end
  
  # total taxes value of cart
  def sales_tax
    return (@listOfItem.inject(0){|sum,e| sum += e.product.sales_tax + e.product.import_tax}).round_to(2)
  end
  
  # total value of cart
  def total
    return (@listOfItem.inject(0){|sum,e| sum += e.total}).round_to(2)
  end
  
  # write Cart out to file
  def write_csv filename
    CSV.open(filename, "w") do |csv|
      @listOfItem.each_with_index { |item, index|       
        if (index == 0)
          csv << ["Quantity", "Name", "Total"]
        end
        csv << [item.quantity, item.product.name, item.total]
        if (index == @listOfItem.size - 1)
          csv << ["Sales taxs:", sales_tax]
          csv << ["Total:", total]
        end
      }
    end
  end
end
