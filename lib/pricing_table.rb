require_relative "grocery_item"

module PricingTable
  def self.price_list
    price_list = {
      "milk" => GroceryItem.new("milk",3.97,5.00,2),
      "bread" => GroceryItem.new("bread",2.17,6,3),
      "apple" => GroceryItem.new("apple",0.89),
      "banana" => GroceryItem.new("banana",0.99)
    }
  end
end