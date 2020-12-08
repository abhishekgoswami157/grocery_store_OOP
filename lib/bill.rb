class Bill
  include PricingTable
  attr_reader :stored_items, :items_with_qty, :total_sale_price, :total_price, :total_discount, :item_sale_price
  def initialize(items_with_qty)
    @items_with_qty = items_with_qty
    @stored_items = PricingTable.price_list
    @total_price = 0
    @total_sale_price = 0
    @total_discount = 0
    @item_sale_price = 0
  end
 
  def actual_price
    stored_items.each do|item, values|
      item_details = stored_items[item]
      @total_price +=  item_details.unit_price * items_with_qty[item.to_s]
    end
    @total_price.round(2)
  end

  def total_discount
    @total_discount = ((actual_price) - (@total_sale_price)).round(2)
  end

  def each_item_price(item)
    item_details = stored_items[item]
      if !item_details.sale_price.nil?
        @item_sale_price =  ((item_details.sale_price) * (items_with_qty[item.to_s] / (item_details.sale_qty))) + ((item_details.unit_price) * (items_with_qty[item.to_s] % (item_details.sale_qty)))
        @total_sale_price += @item_sale_price
        @item_sale_price
      else
        @item_sale_price = item_details.unit_price * items_with_qty[item.to_s]
        @total_sale_price += @item_sale_price
        @item_sale_price
      end
  end

  def create_table
    puts "\n-----------------------------------------------\n"
    puts "\nItems \t\t Qty \t\t Price"
    items_with_qty.each do |item, qty|
     
      puts "#{item} \t\t #{qty} \t\t\t #{each_item_price(item)}"
    end
  end

  def create_bill
    create_table
    puts "\n\n\t Total Price: \t #{@total_sale_price}"
    puts "\t You Saved: \t #{total_discount}"
  end
end