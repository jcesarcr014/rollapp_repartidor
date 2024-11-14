class Usuario {
  int? id;
  String? nombre;
  String? correo;
  String? telefono;
  String? latActual;
  String? lngActcual;

  Usuario(
      {this.id,
      this.nombre,
      this.correo,
      this.telefono,
      this.latActual,
      this.lngActcual});
}

Usuario usuarioSesion = Usuario();