require 'rubygems'
require 'rest_client'
require 'json'

class Twitter

  # Constructor
  def initialize
    @url_trends = 'https://api.twitter.com/1/trends/1.json'
  end

  # Obtener las Trends en un Hash
  # OBS: trends devuelve un objeto de clase Hash, con un indice denominado "trends" el cual permite acceder a los
  # trends del momento. Ademas, es posible acceder a cada una de sus URLs mediante el indice "url"
  def getTrends
    response = RestClient.get(@url_trends)
    trends_json = response.body
    trends = JSON.parse(trends_json)[0]
  end

  def searchTweets(busqueda)
    @url_busqueda = "http://search.twitter.com/search.json?q=" + busqueda + "&rpp=10"
    response = RestClient.get(@url_busqueda)
    busqueda_json = response.body
    busqueda =  JSON.parse(busqueda_json)
  end

  def getUser(nombreUsuario)
    @url_usuario =  "https://api.twitter.com/1/users/show.json?screen_name=" + nombreUsuario
    response = RestClient.get(@url_usuario)
    usuario_json = response.body
    usuario =  JSON.parse(usuario_json)
  end

end