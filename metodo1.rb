def acronimo(texto)
    
texto=texto.strip.split(/\s+/)
a=''
texto.each do |palabra|
    a<<palabra[0..0]
    
end
return a
end


puts acronimo("la palabra de ejemplo")
