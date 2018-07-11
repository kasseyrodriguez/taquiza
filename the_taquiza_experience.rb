require './menu.rb'

def the_breaks
  puts "*" * 70
end

def short_breaks
  print "*" * 2
end

def the_loop(choice)
  puts ""
  MENU[:sections].each_with_index do |section, i|
    num = 0
    section[:items].each do |section|
      if i == choice.to_i
        puts "#{short_breaks}Press #{num} for #{section[:name]} #{section[:price]}"
        if choice.to_i != 2
        puts "   #{section[:description]}"
        end
        puts ""
        num =num + 1
      end
    end
  end
  selection= gets.chomp.to_i
  # selectionArray += selection
  # puts "Press 1- To Place Another Order\nPress 3- To Get Check"
  # anotherChoice= gets.chomp.to_i
  # if anotherChoice == "3"
  return [MENU[:sections][choice.to_i][:items][selection][:price], MENU[:sections][choice.to_i][:items][selection][:name]]
# else
#   the_loop(selection)
# end

end



def show_sections
  puts "Select the Section of the Menu you want to View: "
  puts ""
  MENU[:sections].each_with_index do |section, i|
    puts "press #{i}-#{section[:name]}"
  end
  puts "press Q to quit"
  choice= gets.chomp
end
def print_the_check(items)
p items


end

def calculations(items)
  p item
  # bill = pick
  # bill=bill.to_f
  # tip = (bill * 0.20)
  # total =bill + tip
  # return "The total is $%0.2f"%[total]
end

#The welcoming
def the_order
  ordered_items = []
  the_breaks

  puts "Welcome to Taquiza!!\n"
  check = false
  until check
    choice = show_sections
    if (choice.downcase == "q" || choice.downcase == "quit")
      check = true
    else
    pick = the_loop(choice)
  end
  ordered_items << pick
  ordered_items
  end
  print_the_check(ordered_items)
  # puts calculations(ordered_items)
end

# Call the main method
the_order
