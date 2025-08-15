import 'package:arvivet_app/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  static Future<UserData?> fetchUserData(int userId) async {
    final response = await Supabase.instance.client.from('users').select('''
      id,
      nombre,
      correo,
      telefono,
      direccion
      ''').eq('id', userId).maybeSingle();

    if (response == null) return null;
    return UserData.fromJson(response);
  }

  static Future<bool> updateUserData(int userId, Map<String, dynamic> data) async {
  try {
    // ignore: unused_local_variable
    final response = await Supabase.instance.client
        .from('users')
        .update(data)
        .eq('id', userId);

    // Si no hubo excepción y no es null, el update fue exitoso
    return true;
  } catch (error) {
    print('Error al actualizar usuario: $error');
    return false;
  }
}

}
