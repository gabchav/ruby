print "Imprimir Cuenta Regresiva de los Números Impares de un Rango\n\n"

puts 'Ingrese Primer Número'
n1 = gets.to_i

puts 'Ingrese Segundo Número'
n2 = gets.to_i
system('clear')

men = n1 < n2 ? n1 : n2
may = n1 > n2 ? n1 : n2

puts "Rango Inverso de Impares desde el #{men} al #{may}"
(men..may).to_a.reverse.each do |n|
  puts n if n.odd?
end
