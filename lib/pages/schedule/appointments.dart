import 'package:arvivet_app/pages/schedule/schedule_appointment.dart';
import 'package:arvivet_app/widgets/schedule_appointment/show_appointment_dialog.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';

class Appointment {
  final DateTime dateTime;
  final String type;
  final String doctor;
  final String location;

  Appointment({
    required this.dateTime,
    required this.type,
    required this.doctor,
    required this.location,
  });
}

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  int _segment = 0;
  DateTime? _fechaSeleccionada;

  final List<Appointment> _upcoming = [
    Appointment(
        dateTime: DateTime(2025, 5, 25, 10, 0),
        type: 'Desparasitación',
        doctor: 'Dra. Alejandra Díaz',
        location: 'Consultorio Sur'),
    Appointment(
        dateTime: DateTime(2025, 5, 30, 13, 0),
        type: 'Vacuna',
        doctor: 'Dr. Diego Flores',
        location: 'Consultorio Norte'),
    Appointment(
        dateTime: DateTime(2025, 6, 1, 7, 0),
        type: 'Profilaxis',
        doctor: 'Dr. Ricardo Luna',
        location: 'Consultorio Norte'),
    Appointment(
        dateTime: DateTime(2025, 6, 10, 15, 0),
        type: 'Consulta general',
        doctor: 'Dra. María Solorsano',
        location: 'Consultorio Sur'),
    Appointment(
        dateTime: DateTime(2025, 6, 28, 10, 0),
        type: 'Peluquería',
        doctor: 'Peluq. Alex Quiróz',
        location: 'Consultorio Sur'),
  ];

  final List<Appointment> _finished = [
    Appointment(
        dateTime: DateTime(2025, 5, 1, 11, 0),
        type: 'Laboratorio',
        doctor: 'Dr. Luis Castro',
        location: 'Consultorio Sur'),
    Appointment(
        dateTime: DateTime(2025, 5, 10, 12, 0),
        type: 'Laboratorio',
        doctor: 'Dr. Luis Castro',
        location: 'Consultorio Sur'),
    Appointment(
        dateTime: DateTime(2025, 5, 17, 15, 0),
        type: 'Laboratorio',
        doctor: 'Dr. Luis Castro',
        location: 'Consultorio Sur'),
    Appointment(
        dateTime: DateTime(2025, 5, 20, 7, 0),
        type: 'Laboratorio',
        doctor: 'Dr. Luis Castro',
        location: 'Consultorio Sur'),
  ];

  @override
  Widget build(BuildContext context) {
    final isUpcoming = _segment == 0;
    final rawAppointments = isUpcoming ? _upcoming : _finished;

    final appointments = _fechaSeleccionada == null
        ? rawAppointments
        : rawAppointments
            .where((a) => a.dateTime.compareTo(_fechaSeleccionada!) >= 0)
            .toList();

    return Scaffold(
      appBar: const CustomAppBar(label: 'Historial de Citas'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: _segment,
              thumbColor: AppColors.primaryGreen,
              padding: const EdgeInsets.all(4),
              children: const {
                0: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Próximas')),
                1: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Completadas')),
              },
              onValueChanged: (int? v) {
                setState(() {
                  _segment = v ?? 0;
                  _fechaSeleccionada = null;
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _fechaSeleccionada == null
                      ? 'Todas las fechas'
                      : 'Desde: ${DateFormat('dd/MM/yyyy').format(_fechaSeleccionada!)}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        final DateTime now = DateTime.now();
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _fechaSeleccionada ?? now,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(now.year + 1),
                          locale: const Locale('es', 'ES'),
                        );
                        if (picked != null) {
                          setState(() {
                            _fechaSeleccionada = picked;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today, size: 18),
                      label: const Text('Filtrar por fecha'),
                    ),
                    if (_fechaSeleccionada != null)
                      IconButton(
                        tooltip: 'Quitar filtro',
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _fechaSeleccionada = null;
                          });
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: appointments.isEmpty
                ? const Center(
                    child: Text('No hay citas para la fecha seleccionada'),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                    itemCount: appointments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (_, i) => _AppointmentCard(
                      appt: appointments[i],
                      upcoming: _segment == 0,
                    ),
                  ),
          ),
          Container(
            color: Colors.white, // fondo blanco
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: Center(
              child: CustomButton(
                description: 'Agendar cita',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScheduleAppointment(),
                    ),
                  );
                },
                primaryColor: AppColors.primaryGreen,
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({
    required this.appt,
    required this.upcoming,
  });

  final Appointment appt;
  final bool upcoming;

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd MMMM yyyy', 'es_ES');
    final timeFmt = DateFormat('HH:mm a', 'es_ES');

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
                          dateFmt.format(appt.dateTime),
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
                              date: appt.dateTime,
                              time: DateFormat('HH:mm a', 'es_ES')
                                  .format(appt.dateTime)
                                  .toUpperCase(),
                              type: appt.type,
                              doctor: appt.doctor,
                              location: appt.location,
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
                      timeFmt.format(appt.dateTime).toUpperCase(),
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    appt.type,
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
                          appt.doctor,
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
                          appt.location,
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
