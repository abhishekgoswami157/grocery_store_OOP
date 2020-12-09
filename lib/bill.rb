require_relative "pricing_table"
require_relative "cart"

class Bill
  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def actual_price
    @cart.reduce(0){|price, item| price += item.actual_price}
  end

  def total_sale_price
    @cart.reduce(0){|price, item| price += item.sale_price}
  end

  def total_discount
    actual_price - total_sale_price
  end

  def create_table
    puts "\n-----------------------------------------------\n"
    puts "\nItems \t\t Qty \t\t Price"
    @cart.each do |ordered_item|
      puts "#{ordered_item.item} \t\t #{ordered_item.qty} \t\t #{ordered_item.sale_price}"
    end
  end

  def create_bill
    create_table
    puts "\n\n\t Total Price: \t #{total_sale_price.round(2)}"
    puts "\t You Saved: \t #{total_discount.round(2)}"
  end
end
















