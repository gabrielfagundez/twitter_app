class Trend
  attr_accessor :texto, :url

  def initialize(texto, url)
    @texto = texto
    @url = url
  end

  def to_s
    'Trend: ' + @texto + ", URL: "  + @url
  end
end