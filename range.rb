print "Imprimir Cuenta Regresiva de los Números Impares de un Rango\n\n"

puts "Ingrese Primer Número"
n1=gets.to_i

puts "Ingrese Segundo Número"
n2=gets.to_i

range=(n1..n2).to_a

range.reverse.each do |n|
    if n%2==0
    else
        puts n
    end
end
