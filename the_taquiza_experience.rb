  # require './menu.rb'
  menu = {
    sections: [
      {name: "Tacos",
        items: [
          {name:"Al Pastor",description:"pork, achiote, pineapple",price:"3.50"},
          {name:"Chorizo",description:"pork, paprika, cumin, garlic ",price:"3.50"},
          {name:"Barbacoa",description:"beef, cumin, pasilla negra ",price: "3.50"},
          {name:"Pollo",description:"chicken, scallion, cilantro",price:"3.50"},
          {name:"Huitlacoche",description:"corn ‘truffle’, corn, scallion",price:"3.50"},
          {name:"Carnitas",description:"pork, orange, cinnamon ",price:"3.50"},
          {name:"Asada",description:"steak, citrus, chile de arbol ",price:"5.00"},
          {name:"Lengua",description:"beef tongue, cerveza victoria",price:"3.50"},
          {name:"Camaron",description:"shrimp, red ‘mole’, slaw ",price:"5.00"},
          {name:"Rajas",description:"poblano, onion, crema, cotija",price:"3.50"},
          {name:"Chapulines",description:"grasshoppers, avocado, tajin",price:"3.50"}

          ]},
          {name: "Sides",
            items: [
              {name:"Totopos",description:"hand torn blue masa chips",price:"5.00"},
              {name:"Elote",description:"charred corn, cilantrojalapeno crema, cotija",price:"5.00"},
              {name:"Quinoa",description:"jicama, corn, scallion, chile, nopal dressing",price:"6.50"}
              ]},
              {name: "Cerveza",
                items:[
                  {name:"Corona", price:"7.00"},
                  {name:"Corona light", price:"6.00"},
                  {name:"Negra Modelo", price:"6.00"},
                  {name:"Pacifico", price:"6.00"},
                  {name:"Tecate", price:"5.00"},
                  {name:"Victoria", price:"6.00"},
                  {name:"Rotating Craft Selection", price:"8.00"}
                  ]},
                  {name: "Breakfast ",
                    items:[
                      {name:"Huevos A La Mexicana",description:"scrambled eggs, pico, frijoles, crema, tortillas ",price:"5.00"},
                      {name:"Quesadillas De Epazote",description:"queso chihuahua, cotija, epazote, pico, frijoles ",price:"5.00"},
                      {name:"Tostada De Aguacate",description:"avocado, egg, frijoles, cabbage, cotija ",price:"6.00"},
                      {name:"Chilaquiles",description:"crispy masa, pollo, salsa roja,eggs, crema ",price:"6.00"},
                      {name:"Tortilla De Aguacate",description:"avocado, queso chihuahua, cotija, frijoles ",price:"6.00"}
                      ]},
                      {name: "Coffee & Tea ",
                        items:[
                          {name:"La Endulzada",description:"espresso, condensed milk, ice, shaken ",price:"5.00"},
                          {name:"Green Tea",description:"Jasmine Cloud by JoJo Tea ",price:"3.00"},
                          {name:"Orange Juice",description:"Fresh Squeezed Florida OJ ",price:"5.00"}
                          ]},
                        ]
                      }

                    def the_breaks
                      puts "*" * 70
                    end

                    def short_breaks
                      print "*" * 2
                    end

                    def the_loop(menu, choice)
                      puts ""
                      menu[:sections].each_with_index do |section, i|
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
                      return menu[:sections][choice.to_i][:items][selection][:price]
                    end

                    def the_loop_no_description(menu, choice)
                      puts ""
                      menu[:sections].each_with_index do |section, i|
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
                      return menu[:sections][choice.to_i][:items][selection][:price]
                    end

                    def tacos_section(menu, choice)
                      the_loop(menu, choice)
                    end

                    def sides_section(menu, choice)
                      the_loop(menu, choice)
                    end
                    def beer_section(menu, choice)
                      the_loop_no_description(menu, choice)
                    end

                    def breakfast_section(menu, choice)
                      the_loop(menu, choice)
                    end

                    def coffee_section(menu, choice)
                      the_loop(menu, choice)
                    end

                    def cases(choice, menu)
                      case choice
                      when "0"
                        the_breaks
                      return tacos_section(menu, choice)
                      when "1"
                        the_breaks
                      return sides_section(menu, choice)
                      when "2"
                        the_breaks
                        return beer_section(menu, choice)
                      when "3"
                        the_breaks
                      return   breakfast_section(menu, choice)
                      when "4"
                        the_breaks
                      return coffee_section(menu, choice)
                      else
                        puts "Need make a choice"
                      end
                    end


                    def show_sections(menu)
                      puts "Select the Section of the Menu you want to View: "
                      puts ""
                      menu[:sections].each_with_index do |section, i|
                        puts "press #{i}-#{section[:name]}"
                      end
                      choice= gets.chomp
                      bill =cases(choice, menu)
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
                      show_sections(menu)
                    end
