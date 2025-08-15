class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  int? userId;
  String? _nombre;
  String? rol;

  String? get nombre => _nombre;
  set nombre(String? value) => _nombre = value;

  void setUser(Map<String, dynamic> user) {
    userId = user['id'];
    _nombre = user['nombre'];
    rol = user['rol'];
  }

  void updateName(String updateName) {
    if (_nombre != updateName) {
      _nombre = updateName;
    }
  }
}
