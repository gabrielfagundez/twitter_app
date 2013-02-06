class Tweet
  attr_accessor :texto, :usuario

  def initialize(texto, usuario)
    @texto = texto
    @usuario = usuario
  end

  def to_s
    "El usuario @" + @usuario + "publico:\n" + @texto
    end
end