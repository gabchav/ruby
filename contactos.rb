menores=[]
mayores=[]

loop do 
    persona={}
puts "Ingrese nombre (Para terminar escriba S)"
nombre=gets.chomp
break if nombre=='s'||nombre=='S'

puts "Ingrese edad"
edad=gets.chomp

persona[:nombre]=nombre
persona[:edad]=edad

if edad.to_i<18 
    menores << persona
else
    mayores << persona
end

end

puts "MENORES"
p menores
puts "MAYORES"
p mayores
