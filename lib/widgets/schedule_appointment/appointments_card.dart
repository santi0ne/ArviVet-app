import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/models/appointments.dart';
import 'package:arvivet_app/widgets/schedule_appointment/show_appointment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final bool upcoming;

  const AppointmentCard({
    super.key,
    required this.appointment,
    required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd MMMM yyyy', 'es_ES');

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 150,
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.calendar_month,
                          size: 16, color: AppColors.primaryBlue),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          dateFmt.format(appointment.date),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ),
                      if (!upcoming)
                        IconButton(
                          icon: const Icon(Icons.receipt_long,
                              size: 18, color: Colors.green),
                          tooltip: 'Ver detalle',
                          onPressed: () {
                            showAppointmentDialog(
                              context: context,
                              date: appointment.date,
                              time: appointment.hour,
                              speciality: appointment.specialityName ?? '',
                              vet: appointment.vetName ?? '',
                              direction: appointment.branchDirection ?? '',
                            );
                          },
                        ),
                      IconButton(
                        icon: Icon(Icons.delete,
                            size: 18, color: Colors.red.shade700),
                        tooltip: 'Eliminar',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('¿Eliminar cita?'),
                              content: const Text(
                                  '¿Estás seguro de que deseas eliminar esta cita? Esta acción no se puede deshacer.'),
                              actions: [
                                TextButton(
                                  child: const Text('Cancelar'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Text('Eliminar'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Cita eliminada.'),
                                        backgroundColor: Colors.redAccent,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 2),
                    child: Text(
                      appointment.hour,
                      style:
                      const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    appointment.specialityName ?? '',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.person_pin,
                          size: 14, color: AppColors.primaryBlue),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          appointment.vetName ?? '',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 14, color: AppColors.primaryBlue),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          appointment.branchDirection ?? '',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
