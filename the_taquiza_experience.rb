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
                      return MENU[:sections][choice.to_i][:items][selection][:price]
                    end



                    def show_sections
                      puts "Select the Section of the Menu you want to View: "
                      puts ""
                      MENU[:sections].each_with_index do |section, i|
                        puts "press #{i}-#{section[:name]}"
                      end
                      choice= gets.chomp
                    end


                    #The welcoming
                    the_breaks
                    puts "Welcome to Taquiza!!\n\nHere Are Your Options: "
                    puts "\nPress 0- To Show Menu"
                    # puts "Press 1- To Place Order\nPress 2- When Done Ordering\nPress 3- To Get Check"
                    pick= gets.chomp
                    if pick == "0"
                      the_breaks
                      choice =show_sections
                    end
                    bill =the_loop(choice)
                    bill=bill.to_f
                    tip = (bill * 0.20)
                    total =bill + tip
                    puts "The total is $%0.2f"%[total]
