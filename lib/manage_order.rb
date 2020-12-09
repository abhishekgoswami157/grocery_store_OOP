require_relative "cart"
require_relative "bill"


class ManageOrder
  attr_reader :items
  def initialize(items)
    @items = items
  end
  def arr_of_items
    @items.downcase.split(",").map{|item| item.strip}
  end
  def create_cart
    Cart.new(arr_of_items).list_items
  end
  def show_bill
    Bill.new(create_cart).create_bill
  end
end