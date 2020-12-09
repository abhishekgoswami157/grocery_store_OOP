require_relative "pricing_table"


class Item
  attr_reader :qty, :item_details
  def initialize(item, qty)
    @item = item
    @qty = qty
    @item_details = PricingTable.price_list[@item]
  end

  def item_sale_price
    if(!item_details.sale_qty.zero? && qty >= item_details.sale_qty)
      item_details.sale_price * (qty / item_details.sale_qty) + (item_details.unit_price * (qty % item_details.sale_qty))
    else
      item_actual_price
    end
  end

  def item_actual_price
    qty * @item_details.unit_price
  end

end
