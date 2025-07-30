class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  int? userId;
  String? nombre;
  String? rol;

  void setUser(Map<String, dynamic> user) {
    userId = user['id'];
    nombre = user['nombre'];
    rol = user['rol'];
  }
}
