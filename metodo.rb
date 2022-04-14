def acronimo(texto)
  texto = texto.strip.split(/\s+/)
  a = ''
  texto.each do |palabra|
    a << palabra[0..0]
  end
  a.upcase
end

puts 'Ejemplo: ', acronimo('Chief Executive Officer')

loop do
  print 'Ingrese una Frase (escriba "x" para terminar):'
  f = gets.chomp
  break if f.upcase == 'X'

  puts acronimo(f)
end
p 'Saliendo...'
