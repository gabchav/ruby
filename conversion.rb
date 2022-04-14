file = File.open('conversion.txt', 'w')
m = "Conversión de Grados Celcius a Fahrenheit\n\n" +
    "Alumno: Gabriel Chávez\n" +
    "Modulo 6: Introducción a la Programación con Ruby\n" +
    "Año 2022\n\n"
file.write(m)
c = -1
loop do
  c = (c + 1).to_f
  f = (c * 9 / 5) + 32
  file.write("\nGrados C° = #{c.to_i} , y su conversión a F° es = #{f}")
  break if c == 127
end
file.close

file = File.open('conversion.txt', 'r')
file.each_line do |line|
  puts line
end
file.close
