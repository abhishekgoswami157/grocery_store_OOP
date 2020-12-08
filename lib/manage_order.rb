class ManageOrder
  attr_reader :items
  def initialize(items)
    @items = items
    @items_with_qty = {}
  end
  def str_to_arr 
    @items.downcase.split(",").map{|item| item.strip}
  end
  def create_cart
    @items_with_qty = Cart.new(str_to_arr).list_items
  end
  def show_bill
    create_cart
    Bill.new(@items_with_qty).create_bill
  end
end