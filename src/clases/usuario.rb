
class Usuario
  attr_accessor :nombre_usuario, :nombre, :descripcion, :followers

  def initialize
    @nombre_usuario = ""
    @nombre = ""
    @descripcion = ""
    @followers = ""
  end

  def intialize_from_json(json)
    @nombre_usuario = json["screen_name"]
    @nombre = json["name"]
    @descripcion = json["description"]
    @followers = json["followers_count"]
  end

  def to_s
    "Informacion del usuario @" + @nombre_usuario +
        "\n  Nombre: " + @nombre +
        "\n  Cantidad de seguidores: " + @followers.to_s +
        "\n  Descripcion: " + @descripcion
  end
end