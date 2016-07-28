# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ShoppingBasket do
  describe "#INPUT 1" do
      products = [
          Product.new("book", ProductType::BOOK, 12.49),
          Product.new("music cd", ProductType::OTHER, 14.99),
          Product.new("chocolate bar", ProductType::FOOD, 0.85)
        ]
        
        items_in_receipt = [
            ItemInReceipt.new(products[0], 1),
            ItemInReceipt.new(products[1], 1),
            ItemInReceipt.new(products[2], 1)
        ]
        
        receipt = ShoppingBasket.new(items_in_receipt)
        
        expected_total_values = [ 12.49, 16.49, 0.85 ]
        
        items_in_receipt.each_with_index { |item, index|       
          it "Check total for item '#{item.product.name}'" do            
            item.total.should eql expected_total_values[index]
          end
        }
        
        it "Check sales tax of receipt" do            
          receipt.sales_tax.should eql 1.50
        end
    
        it "Check total of receipt" do            
          receipt.total.should eql 29.83
        end
        receipt.write_csv("output1.csv")
    end
end

