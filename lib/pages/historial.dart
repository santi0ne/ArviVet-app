import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; //
import '../utils/app_colors.dart'; // usa tu paleta

/* ---------- dummy data model ---------- */
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

/* ---------- page ---------- */
class VetHistorialPage extends StatefulWidget {
  const VetHistorialPage({super.key});

  @override
  State<VetHistorialPage> createState() => _VetHistorialPageState();
}

class _VetHistorialPageState extends State<VetHistorialPage> {
  int _segment = 0; // 0 = próximas, 1 = completadas

  // Ejemplo de datos: cámbialos por lo que traigas de tu backend
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
    final appointments = isUpcoming ? _upcoming : _finished;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Historial de citas',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black54),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          /* ----- toggle (Próximas / Completadas) ----- */
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
              onValueChanged: (int? v) => setState(() => _segment = v ?? 0),
            ),
          ),
          const SizedBox(height: 12),

          /* ----- list ----- */
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: appointments.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (_, i) => _AppointmentCard(
                appt: appointments[i],
                upcoming: isUpcoming,
              ),
            ),
          ),

          /* ----- “Agendar nueva cita” button (solo en Próximas) ----- */
          if (isUpcoming)
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 24.0, left: 24.0, right: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    // TODO: Navega a tu pantalla de agendar cita
                  },
                  child: const Text(
                    'Agendar nueva cita',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/* ---------- individual card ---------- */
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
          /* vertical colored strip */
          Container(
            width: 6,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* date + optional trailing icon */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_month,
                            size: 16, color: AppColors.primaryBlue),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            dateFmt.format(appt.dateTime),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                        ),
                        if (upcoming)
                          IconButton(
                            icon: const Icon(Icons.edit,
                                size: 18, color: Colors.green),
                            tooltip: 'Editar',
                            onPressed: () {},
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.receipt_long,
                                size: 18, color: Colors.green),
                            tooltip: 'Ver detalle',
                            onPressed: () {},
                          ),
                        IconButton(
                          icon: Icon(upcoming ? Icons.delete : Icons.delete,
                              size: 18, color: Colors.red.shade700),
                          tooltip: 'Eliminar',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    /* time */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 2),
                      child: Text(
                        timeFmt.format(appt.dateTime).toUpperCase(),
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 6),

                    /* type */
                    Text(
                      appt.type,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),

                    /* doctor + location */
                    Row(
                      children: [
                        Icon(Icons.person_pin,
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
                        Icon(Icons.location_on_outlined,
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
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
