import 'package:arvivet_app/widgets/schedule_appointment/appointments.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppointmentServices {
  static Future<List<Appointment>> fetchAppointments(userId) async {
    final response = await Supabase.instance.client
        .from('appointment')
        .select('''
          id,
          date,
          status,
          speciality (
            name
          ),
          vet (
            name
          ),
          branch (
            direction
          ),
          hour
        ''')
        .eq('user_id', userId)
        .order('date', ascending: false);

    return (response as List)
        .map((json) => Appointment.fromJson(json))
        .toList();
  }
}



