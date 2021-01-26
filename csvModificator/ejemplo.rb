require 'CSV'
puts "ingrese un array"
a = gets.split(",")

a.each_with_index do |con, ind|
    puts ind.to_s+" - "+con 
end






 
