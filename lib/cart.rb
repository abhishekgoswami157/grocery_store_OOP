require_relative "item"

class Cart
  attr_reader :frequencies, :cart
  def initialize(items)
    @items_with_qty = items.tally
    @items = items
    @cart = []
  end
 
  def store_items
    @items_with_qty.each do |item, qty|
      @cart << Item.new(item, qty)
    end
    @cart
  end
end

