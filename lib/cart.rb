class Cart
  attr_reader :frequencies
  def initialize(items)
    @frequencies = Hash.new(0)
    @items = items
  end
 
  def list_items
    @items.each do|item|
      @frequencies[item] += 1
    end
    @frequencies
  end
end
