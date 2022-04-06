puts "Cuál es la temperatura?"
t=gets.to_i

puts "Y está lloviendo? (SI/NO)"
lluvia=gets.chomp.downcase

if t>25&&(lluvia=="no"||lluvia=="n")
  puts "Lindo día para pasear"
else
  puts "Hoy me quedo en casa a ver películas"
end
