# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ShoppingBasket do
  # Testing with input 1
  describe "#INPUT 1" do
      #Create data 1
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
      
        #Check expected value
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
  
  # Testing with input 2
  describe "#INPUT 2" do
      #Create data 2
      products = [
          Product.new("imported box of chocolates", ProductType::FOOD, 10.0),
          Product.new("imported bottle of perfume", ProductType::OTHER, 47.5)
        ]
        
        items_in_receipt = [
            ItemInReceipt.new(products[0], 1),
            ItemInReceipt.new(products[1], 1)
        ]
        
        receipt = ShoppingBasket.new(items_in_receipt)
    
        expected_total_values = [ 10.5, 54.65]
        
    #Check expected value
        items_in_receipt.each_with_index { |item, index|       
          it "Check total for item '#{item.product.name}'" do
            item.total.should eql expected_total_values[index]
          end
        }
        
       it "Check sales tax of receipt" do            
          receipt.sales_tax.should eql 7.65
        end
    
        it "Check total of receipt" do            
          receipt.total.should eql 65.15
        end
        receipt.write_csv("output2.csv")
    end
    
  # Testing with input 3
  describe "#INPUT 3" do
    #Create data 3
      products = [
          Product.new("imported bottle of perfume", ProductType::OTHER, 27.99),
          Product.new("bottle of perfume", ProductType::OTHER, 18.99),
          Product.new("packet of headache pills", ProductType::MEDICAL, 9.75),
          Product.new("box of imported chocolates", ProductType::FOOD, 11.25)
        ]
        
        items_in_receipt = [
            ItemInReceipt.new(products[0], 1),
            ItemInReceipt.new(products[1], 1),
            ItemInReceipt.new(products[2], 1),
            ItemInReceipt.new(products[3], 1)
        ]
        
        receipt = ShoppingBasket.new(items_in_receipt)
    
        expected_total_values = [ 32.19, 20.89, 9.75, 11.85 ]
        
        # Check expected value
        items_in_receipt.each_with_index { |item, index|       
          it "Check total for item '#{item.product.name}'" do
            item.total.should eql expected_total_values[index]
          end
        }
    
        it "Check sales tax of receipt" do            
          receipt.sales_tax.should eql 6.70
        end
    
        it "Check total of receipt" do            
          receipt.total.should eql 74.68
        end
        
        receipt.write_csv("output3.csv")
    end
end

