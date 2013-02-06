require_relative 'usuario'

class Tweet
  attr_accessor :texto, :usuario, :fecha, :cantidad_retweets, :cantidad_fav

  def initialize(texto = "", usuario = "", fecha = "")
    @texto = texto
    @usuario = usuario
    @fecha = fecha
  end

  def self.initialize_from_json(json)
    a = Array.new

    json.each do |b|
      a << Tweet.new(b["text"], b["from_user"], b["created_at"])
    end
    a
  end



  def to_s
    "Tweet: \n" +
        "  Usuario: @" + @usuario + "\n" +
        "  " + @texto + "\n" +
        "  Realizado en: " + @fecha
  end
end