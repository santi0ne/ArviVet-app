class UserData {
  final int id;
  final String nombre;
  final String correo;
  final String telefono;
  final String? direccion;

  UserData(
      {required this.id,
      required this.nombre,
      required this.correo,
      required this.telefono,
      required this.direccion});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      correo: json['correo'] as String,
      telefono: json['telefono'] as String,
      direccion: json['direccion'] as String?,
    );
  }
}
