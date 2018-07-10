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
                            puts "   #{section[:description]}"
                            puts ""
                            num =num + 1
                          end
                        end
                      end
                      selection= gets.chomp.to_i
                      return MENU[:sections][choice.to_i][:items][selection][:price]
                    end

                    def the_loop_no_description(choice)
                      puts ""
                      MENU[:sections].each_with_index do |section, i|
                        num = 0
                        section[:items].each do |section|
                          if i == choice.to_i
                            puts "#{short_breaks}Press #{num} for #{section[:name]} #{section[:price]}"
                            puts ""
                            num =num + 1
                          end
                        end
                      end
                      selection= gets.chomp.to_i
                      return MENU[:sections][choice.to_i][:items][selection][:price]
                    end

                    def tacos_section(choice)
                      the_loop(choice)
                    end

                    def sides_section(choice)
                      the_loop(choice)
                    end
                    def beer_section(choice)
                      the_loop_no_description(choice)
                    end

                    def breakfast_section(choice)
                      the_loop(choice)
                    end

                    def coffee_section(choice)
                      the_loop(choice)
                    end

                    def cases(choice)
                      case choice
                      when "0"
                        the_breaks
                      return tacos_section(choice)
                      when "1"
                        the_breaks
                      return sides_section(choice)
                      when "2"
                        the_breaks
                        return beer_section(choice)
                      when "3"
                        the_breaks
                      return   breakfast_section(choice)
                      when "4"
                        the_breaks
                      return coffee_section(choice)
                      else
                        puts "Need make a choice"
                      end
                    end


                    def show_sections
                      puts "Select the Section of the Menu you want to View: "
                      puts ""
                      MENU[:sections].each_with_index do |section, i|
                        puts "press #{i}-#{section[:name]}"
                      end
                      choice= gets.chomp
                      bill =cases(choice)
                      bill=bill.to_f
                      tip = (bill * 0.20)
                      total =bill + tip
                      puts "The total is $%0.2f"%[total]

                    end


                    #The welcoming
                    the_breaks
                    puts "Welcome to Taquiza!!\n\nHere Are Your Options: "
                    puts "\nPress 0- To Show Menu"
                    # puts "Press 1- To Place Order\nPress 2- When Done Ordering\nPress 3- To Get Check"
                    choice= gets.chomp
                    if choice == "0"
                      the_breaks
                      show_sections
                    end
