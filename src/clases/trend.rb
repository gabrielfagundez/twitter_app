class Trend
  attr_accessor :texto, :url

  def initialize(texto = "", url="")
    @texto = texto
    @url = url
  end

  def self.initialize_from_json(json)
    a = Array.new

    # Recorro las trends, creo instancias de la clase y las agrego al arreglo
    json.each do |trend|
      a << Trend.new(trend["name"], trend["url"])
    end
    a
  end

  def to_s
    'Trend: ' + @texto + " - URL: "  + @url
  end
end