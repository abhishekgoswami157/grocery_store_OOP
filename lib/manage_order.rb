require_relative "cart"
require_relative "bill"


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
    Cart.new(str_to_arr).list_items
  end
  def show_bill
    create_cart
    Bill.new(create_cart).create_bill
  end
end