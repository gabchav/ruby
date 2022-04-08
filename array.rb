a = []
loop do
  print 'Ingrese un número (escriba "x" para terminar):'
  n = gets.chomp
  break if n == 'x'|| n=='X'
  a << n
  p a
end
h = {}
for i in 0..(a.length - 1)
  h["número#{i+1}"] = a[i]
end
p h
