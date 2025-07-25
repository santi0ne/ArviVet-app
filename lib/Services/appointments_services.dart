import 'package:arvivet_app/widgets/schedule_appointment/appointments.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppointmentServices {
  static Future<List<Appointment>> fetchAppointments() async { // deberia recibir como argumentos int userId, que es el id del usuario actual logeado a la app
    final response = await Supabase.instance.client
        .from('appointment')
        .select('''
          id,
          date,
          hour,
          status,
          vet (
            name
          ),
          speciality (
            name
          ),
          branch (
            direction
          )
        ''')
        .order('date', ascending: false);

    return (response as List)
        .map((json) => Appointment.fromJson(json))
        .toList();
  }
}



