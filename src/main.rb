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

  # Caso en el cual se desea ver las trends
  if comando == "1" then
    arreglo_trends = t.getTrends

    arreglo_trends.each do |trend|
      puts trend
      puts "\n"
    end

  # Caso en el cual se desea buscar una palabra clave en la red social
  elsif comando == "2" then
    puts "Ingrese la palabra clave que desea buscar: \n"
    busqueda = gets.chomp

    arreglo_tweets = t.searchTweets(busqueda)
    arreglo_tweets.each do |tweet|
      puts tweet
      puts "\n"
    end

  # Caso en el cual se desea buscar un usuario
  elsif comando == "3" then
    puts "Ingrese el nombre del usuario que desea ver: \n"
    usuario = gets.chomp

    puts "\n"
    begin
      u = t.getUser(usuario)
      puts u.to_s
    rescue Exception => e
      puts e.message
    end


  # Caso en el cual se desea salir
  elsif comando == "4" then
    exit = true

  # Comando incorrecto
  else
    puts "Comando Incorrecto.\n"
  end

  puts "*** *** *** *** ***"

end


