menores = []
mayores = []

loop do
  persona = {}
  puts "Ingrese nombre (Para terminar escriba S)"
  persona[:nombre] = gets.chomp
break if persona[:nombre] == 's'||persona[:nombre] == 'S'
  puts "Ingrese edad"
   persona[:edad] = gets.chomp.to_i
   
  if persona[:edad] < 18
    menores << persona
  else
    mayores << persona
  end
end

puts "MENORES", menores, "MAYORES", mayores
