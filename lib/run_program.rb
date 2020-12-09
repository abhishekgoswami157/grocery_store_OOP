require_relative "manage_order"

puts "Please enter all the items pusrchased separated by a comma"
items = gets.chomp
ordered_items = ManageOrder.new(items)
ordered_items.show_bill


  # "milk,milk, bread,banana,bread,bread,bread,milk,apple"