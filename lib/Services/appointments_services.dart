import 'package:arvivet_app/models/appointments.dart';
import 'package:arvivet_app/widgets/schedule_appointment/specialty.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppointmentServices {
  static Future<List<Appointment>> fetchAppointments(int userId) async {
    final response =
        await Supabase.instance.client.from('appointment').select('''
          id,
          date,
          hour,
          status,
          duration_minutes,
          vet (
            name
          ),
          pet (
            name
          ),
          speciality (
            name
          ),
          branch (
            direction
          )
        ''').eq('user_id', userId).order('date', ascending: false);

    return (response as List)
        .map((json) => Appointment.fromJson(json))
        .toList();
  }

  static Future<List<Specialty>> fetchSpecialties() async {
    final response = await Supabase.instance.client
        .from('speciality')
        .select('id, name');

    return (response as List)
        .map((json) => Specialty(
      id: json['id'],
      name: json['name'],
      iconPath: 'assets/images/${json['name'].toLowerCase()}.svg',
    ))
        .toList();


  }

}
