require_relative "./lib/manage_order"

class TakeOrder
  def self.manage
    puts "Please enter all the items pusrchased separated by a comma"
    items = gets.chomp
    if(!items.strip.length.zero?)
      ManageOrder.new(items).show_bill
    else
      puts "Aww!! It seems you didn't enter any item"
      manage
    end
  end
end

TakeOrder.manage

# milk,milk, bread,banana,bread,bread,bread,milk,apple

