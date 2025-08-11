import 'package:arvivet_app/models/appointments.dart';
import 'package:arvivet_app/models/history_pet.dart';
import 'package:arvivet_app/services/appointments_services.dart';
import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class MedicalHistoryRecentVisits extends StatefulWidget {
  final List<HistoryPet> history;

  const MedicalHistoryRecentVisits({super.key, required this.history});

  @override
  State<MedicalHistoryRecentVisits> createState() =>
      _MedicalHistoryRecentVisitsState();
}

class _MedicalHistoryRecentVisitsState
    extends State<MedicalHistoryRecentVisits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.medical_services,
                  size: 20,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Visitas Recientes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.history.isEmpty)
            const Text(
              'No hay visitas recientes.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            )
          else
            ...widget.history.map((h) => FutureBuilder<Appointment?>(
                  future:
                      AppointmentServices.fetchAppointmentById(h.idAppointment),
                  builder: (context, snapshot) {
                    final speciality =
                        snapshot.data?.specialityName ?? 'Especialidad';
                    final date = h.record != null
                        ? "${h.record!.day.toString().padLeft(2, '0')}/${h.record!.month.toString().padLeft(2, '0')}/${h.record!.year}"
                        : '';
                    final notes = h.treatmentDetal
                        .split(';')
                        .map((tit) => tit.split(':').first.trim())
                        .join('\n');

                    return buildVisitItem(
                      speciality,
                      date,
                      snapshot.data?.vetName ?? '',
                      notes,
                    );
                  },
                )),
        ],
      ),
    );
  }
}
