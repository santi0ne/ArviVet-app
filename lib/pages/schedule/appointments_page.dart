import 'package:arvivet_app/layout.dart';
import 'package:arvivet_app/services/appointments_services.dart';
import 'package:arvivet_app/pages/schedule/schedule_appointment.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/widgets/schedule_appointment/appointments_card.dart';
import 'package:arvivet_app/models/appointments.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => AppointmentsPageState();
}

class AppointmentsPageState extends State<AppointmentsPage> {
  int _segment = 0;
  DateTime? _fechaSeleccionada;

  List<Appointment> _appointments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    try {
      final userId = SessionManager().userId;
      if (userId == null) throw Exception('No hay usuario autenticado');
      final data = await AppointmentServices.fetchAppointments(userId);

      setState(() {
        _appointments = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isUpcoming = _segment == 0;

    final rawAppointments = _appointments
        .where(
          (a) => isUpcoming
              ? a.status.toLowerCase() == 'pendiente'
              : a.status.toLowerCase() == 'completada',
        )
        .toList();

    final appointments = _fechaSeleccionada == null
        ? rawAppointments
        : rawAppointments
            .where((a) => a.date.compareTo(_fechaSeleccionada!) >= 0)
            .toList();

    return Scaffold(
      appBar: CustomAppBar(
          label: 'Historial de Citas',
          onBack: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainLayout()))),
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
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : appointments.isEmpty
                    ? const Center(
                        child: Text('No hay citas para la fecha seleccionada'),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                        itemCount: appointments.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 14),
                        itemBuilder: (_, i) => AppointmentCard(
                          appointment: appointments[i],
                          upcoming: _segment == 0,
                        ),
                      ),
          ),
          Container(
            color: AppColors.whiteColor, // fondo blanco
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateTime?>(
        '_fechaSeleccionada', _fechaSeleccionada));
  }
}
