class Usuario
  attr_accessor :nombre_usuario, :nombre, :descripcion

  def initialize(nombre_usuario, nombre, descripcion)
    @nombre_usuario = nombre_usuario
    @nombre = nombre
    @descripcion = descripcion
  end

  def to_s
    "El usuario identificado como @" + @nombre_usuario + " se llama " + @nombre + " y posee como descripcion en su cuenta de Twitter " + @descripcion + "."
  end
end