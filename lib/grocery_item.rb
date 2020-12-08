class GroceryItem
  attr_reader :item, :unit_price, :sale_price, :sale_qty
  def initialize(item, unit_price, sale_price=nil, sale_qty=nil)
    @item = item
    @unit_price = unit_price
    @sale_price = sale_price
    @sale_qty = sale_qty
  end
end