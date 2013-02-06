require 'rubygems'
require 'rest_client'
require 'json'
require 'net/http'

require_relative 'trend'
require_relative 'tweet'
require_relative 'usuario'

URL_BASE = "api.twitter.com"
URL_BUSQUEDA = "search.twitter.com"

class Twitter

  # Constructor
  def initialize
  end

  # Obtener las Trends en un Hash
  # OBS: trends devuelve un objeto de clase Hash, con un indice denominado "trends" el cual permite acceder a los
  # trends del momento. Ademas, es posible acceder a cada una de sus URLs mediante el indice "url"
  def getTrends
    url = "/1/trends/1.json"

    trends = ""
    response = Net::HTTP.get_response(URL_BASE, url)
    case response
      when Net::HTTPSuccess then
        trends = JSON.parse(response.body)[0]["trends"]
      else
        raise Exception, 'No se pueden obtener las trends'
    end

    t = Trend.new
    arreglo_trends = t.initialize_from_json(trends)
  end


  # Dado un parametro de busqueda, se realiza una busqueda en Twitter y se retorna un arreglo de tweets
  # con 10 elemenos, en caso de haberlos
  def searchTweets(busqueda)
    url = "/search.json?q=" + busqueda + "&rpp=10"

    res = ""
    response = Net::HTTP.get_response(URL_BUSQUEDA, url)
    res = JSON.parse(response.body)["results"]

    t = Tweet.new
    arreglo_tweets = t.initialize_from_json(res)
  end


  # Dado un nombre de usuario, obtiene informacion extra relacionada con el mismo y lo almacena en una instancia de la
  # clase usuario. Ademas lo retorna.
  def getUser(nombre_usuario)
    url = "/1/users/show.json?screen_name=" + nombre_usuario

    usuario = ""
    response = Net::HTTP.get_response(URL_BASE, url)
    case response
      when Net::HTTPSuccess then
        usuario = JSON.parse(response.body)
      else
        raise Exception, 'El usuario no existe o se tienen problemas en la conexion'
    end

    u = Usuario.new
    u.intialize_from_json(usuario)
    u
  end
end