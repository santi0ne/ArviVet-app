import 'package:supabase_flutter/supabase_flutter.dart';

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

      // Si el resultado es una lista vacía => login fallido
      if (result == null || (result is List && result.isEmpty)) {
        throw Exception('Credenciales inválidas');
      }

      // Si el procedimiento devuelve un usuario como lista de un solo objeto:
      final user = (result as List).first as Map<String, dynamic>;
      return user;
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }
}
