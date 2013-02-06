require_relative 'clases/twitter_class.rb'

t = Twitter.new
exit = false

while !exit do
  puts "Seleccione una de las opciones y presione enter: \n"
  puts "1 - Obtener las trending topics mundiales de Twitter.\n"
  puts "2 - Realizar una busqueda de Tweets.\n"
  puts "3 - Ver el resumen de un usuario de Twitter.\n"
  puts "4 - Salir.\n\n"

  puts "Ingrese uno de los comandos: \n"
  comando = gets.chomp
  puts "\n"

  # Caso en el cual se desea ver las trends
  if comando == "1" then
    t.getTrends["trends"].each do |trend|
      linea = 'Trend: ' + trend["name"] + ", URL: "  + trend["url"] + "\n\n"
      puts linea
    end

  # Caso en el cual se desea buscar una palabra clave en la red social
  elsif comando == "2" then
    puts "Ingrese la palabra clave que desea buscar: \n"
    busqueda = gets.chomp

    t.searchTweets(busqueda)["results"].each do |tweet|
      linea = "El usuario @" + tweet["from_user"] + " publico: \n" + tweet["text"] + "\n\n"
      puts linea
    end

  # Caso en el cual se desea buscar un usuario
  elsif comando == "3" then
    puts "Ingrese el nombre del usuario que desea ver: \n"
    usuario = gets.chomp

    linea = "El usuario buscado tiene como nombre de usuario @" + usuario + ".\n"
    linea = linea + "Su nombre es " + t.getUser(usuario)["name"] + ".\n"
    linea = linea + "Su descripcion es la siguiente: \n" + t.getUser(usuario)["description"] + "\n"

    puts linea

  # Caso en el cual se desea salir
  elsif comando == "4" then
    exit = true

  # Comando incorrecto
  else
    puts "Comando Incorrecto.\n"
  end

  puts "*** *** *** *** ***"

end


