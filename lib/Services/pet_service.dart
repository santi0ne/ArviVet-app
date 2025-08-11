import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:arvivet_app/models/pet.dart';

class PetService {
  static Future<Pet?> fetchPetOfCurrentUser(int userId) async {
    final response = await Supabase.instance.client
        .from('pet')
        .select()
        .eq('owner_id', userId)
        .maybeSingle();

    if (response == null) return null;

    return Pet.fromJson(response);
  }
}
