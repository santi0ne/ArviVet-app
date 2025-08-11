import 'package:arvivet_app/services/appointments_services.dart';
import 'package:arvivet_app/models/appointments.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/widgets/schedule_appointment/appointments_card.dart';
import 'package:flutter/material.dart';

class HomeScheduledAppointments extends StatelessWidget {
  const HomeScheduledAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = SessionManager().userId;
    if (userId == null) {
      return const Center(child: Text('No hay usuario autenticado'));
    }

    return FutureBuilder<List<Appointment>>(
      future: AppointmentServices.fetchAppointments(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Text('Error al cargar las citas');
        }

        final appointments = snapshot.data ?? [];
        final pendingAppointments = appointments
            .where((a) => a.status.toLowerCase() == 'pendiente')
            .toList();

        pendingAppointments.sort((a, b) => b.date.compareTo(a.date));
        final recent =
            pendingAppointments.isNotEmpty ? pendingAppointments.first : null;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Citas Programadas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.fontColor.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: recent == null
                    ? Column(
                        children: [
                          const Text(
                            'No tiene citas pendientes',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryGreen,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Agrega una nueva cita',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : AppointmentCard(
                        appointment: recent,
                        upcoming: true,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
