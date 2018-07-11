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
  price = MENU[:sections][choice.to_i][:items][selection][:price]
  name = MENU[:sections][choice.to_i][:items][selection][:name]
  return [name, price]
end



def show_sections
  puts "Select the Section of the Menu you want to View: "
  puts ""
  MENU[:sections].each_with_index do |section, i|
    puts "press #{i}-#{section[:name]}"
  end
  puts "press c for the Check"
  choice= gets.chomp
end

def the_check(items)
  the_breaks
  puts "\nHere is your check:"
  puts ""
  items =items.flatten
  items.each_with_index do |element, index|
    if index % 2 == 0
      print "#{element}: "
    elsif not index % 2 ==0
      # print element
      # puts ""
      print  "$%0.2f"%[element]
      puts ""
    end
  end
end

def the_calculations(items)
  total = 0
  items =items.flatten
  items.each_with_index do |element, index|
    if not index % 2 ==0
      element =element.to_f
      total += element
    end
  end
  total.to_f
  tip = (total * 0.20)
  total_with_tip = total + tip
  puts ""
  puts  "Total: $%0.2f" %[total]
  puts "Total with tip: $%0.2f"%[total_with_tip]

end

def the_order
  ordered_items = []
  the_breaks

  puts "Welcome to Taquiza!!\n"
  check = false
  until check
    choice = show_sections
    if (choice.downcase == "c" || choice.downcase == "check")
      check = true
    else
      pick = the_loop(choice)
      ordered_items << pick
    end

  end
  the_check(ordered_items)
  the_calculations(ordered_items)
end

# Call the main method
the_order
