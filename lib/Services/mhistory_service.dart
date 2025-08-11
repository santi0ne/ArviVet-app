import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:arvivet_app/models/history_pet.dart';

class HistoryPetServices {
  static Future<List<HistoryPet>> fetchHistoryByPet(int petId) async {
    final response = await Supabase.instance.client
        .from('history_pet')
        .select()
        .eq('id_pet', petId)
        .order('record', ascending: false);

    return (response as List).map((json) => HistoryPet.fromJson(json)).toList();
  }

  static Future<HistoryPet?> fetchHistoryByIdEntry(
      int idEntry, int petId) async {
    final response = await Supabase.instance.client
        .from('history_pet')
        .select()
        .eq('id_entry', idEntry)
        .eq('id_pet', petId)
        .maybeSingle();

    if (response == null) return null;
    return HistoryPet.fromJson(response);
  }

  static Future<void> insertHistoryPet(HistoryPet history) async {
    await Supabase.instance.client.from('history_pet').insert({
      'id_pet': history.idPet,
      'id_appointment': history.idAppointment,
      'treatment_detal': history.treatmentDetal,
      'observations': history.observations,
      'record': history.record?.toIso8601String(),
    });
  }
}
