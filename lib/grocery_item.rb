class GroceryItem
  attr_reader :item, :unit_price, :sale_price, :sale_qty
  def initialize(item, unit_price, sale_price=0, sale_qty=0)
    @item = item
    @unit_price = unit_price
    @sale_price = sale_price
    @sale_qty = sale_qty
  end
end