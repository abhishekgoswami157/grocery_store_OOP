require_relative "item"

class Cart
  attr_reader :frequencies, :cart
  def initialize(items)
    @frequencies = items.tally
    @items = items
    @cart = []
  end
 
  def list_items
    # @items.each do|item|
    #   @frequencies[item] += 1
    # end
    # print @items
    # puts @frequencies
    @frequencies.each do |item, qty|
      @cart << Item.new(item, qty)
      
    end
    # puts @cart
    # @cart
    @frequencies

  end
end

