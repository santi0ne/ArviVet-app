import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:arvivet_app/utils/session_manager.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> registrarUsuario({
    required String nombre,
    required String correo,
    required String contrasena,
    required String telefono,
    required String direccion,
  }) async {
    try {
      await _client.rpc('registrar_usuario', params: {
        'p_nombre': nombre,
        'p_correo': correo,
        'p_contrasena': contrasena,
        'p_telefono': telefono,
        'p_direccion': direccion,
      });
    } catch (e) {
      throw Exception('Error al registrar usuario: $e');
    }
  }

  Future<Map<String, dynamic>> loginUsuario({
    required String correo,
    required String contrasena,
  }) async {
    try {
      final result = await _client.rpc('login_usuario', params: {
        'p_correo': correo,
        'p_contrasena': contrasena,
      });

      if (result == null || (result is List && result.isEmpty)) {
        throw Exception('Credenciales inválidas');
      }

      final user = (result as List).first as Map<String, dynamic>;
      return user;
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  Future<void> logoutUsuario() async {
    try {
      final sessionManager = SessionManager();
      sessionManager.userId = null;
      sessionManager.nombre = null;
      sessionManager.rol = null;

      if (_client.auth.currentSession != null) {
        await _client.auth.signOut();
      }
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }
}
