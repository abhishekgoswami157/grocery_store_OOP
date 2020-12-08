class Bill
  attr_reader :stored_items, :items_with_qty, :total_sale_price, :total_price, :total_discount, :item_sale_price
  def initialize(items_with_qty)
    @items_with_qty = items_with_qty
    @stored_items = PricingTable.new.price_list
    @total_price = 0
    @total_sale_price = 0
    @total_discount = 0
    @item_sale_price = 0
  end
 
  def actual_price
    stored_items.each do|item, values|
      @total_price +=  values[:unit_price] * items_with_qty[item.to_s]
    end
    @total_price.round(2)
  end

  def total_discount
    @total_discount = ((actual_price) - (@total_sale_price)).round(2)
  end

  def each_item_price(item)
      if !stored_items[item.to_sym][:sale_price].nil?
        @item_sale_price =  ((stored_items[item.to_sym][:sale_price]) * (items_with_qty[item.to_s] / (stored_items[item.to_sym][:sale_qty]))) + ((stored_items[item.to_sym][:unit_price]) * (items_with_qty[item.to_s] % (stored_items[item.to_sym][:sale_qty])))
        @total_sale_price += @item_sale_price
        @item_sale_price
      else
        @item_sale_price = stored_items[item.to_sym][:unit_price] * items_with_qty[item.to_s]
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