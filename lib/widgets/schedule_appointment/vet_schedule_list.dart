import 'package:flutter/material.dart';
import 'package:arvivet_app/widgets/schedule_appointment/doctor_info_card.dart';
import 'package:arvivet_app/services/vet_schedule_service.dart';

class VetScheduleList extends StatefulWidget {
  final int specialityId;
  final DateTime selectedDate;
  final int? selectedVetId;
  final String? selectedHour;
  final Function(int vetId, String hour) onTimeSelected;

  const VetScheduleList({
    super.key,
    required this.specialityId,
    required this.selectedDate,
    required this.selectedVetId,
    required this.selectedHour,
    required this.onTimeSelected,
  });

  @override
  State<VetScheduleList> createState() => _VetScheduleListState();
}

class _VetScheduleListState extends State<VetScheduleList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VetScheduleService.fetchSchedules(
        specialityId: widget.specialityId,
        weekday: widget.selectedDate.weekday,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
          return const Center(
            child: Text('No hay doctores disponibles ese día para esta especialidad'),
          );
        }

        final schedules = snapshot.data!;

        return Column(
          children: schedules.map((horario) {
            final blocks = VetScheduleService.generateBlocks(
              horario.startTime,
              horario.endTime,
              20,
            );

            return Column(
              children: [
                StatefulBuilder(
                  builder: (context, localSetState) {
                    return DoctorInfoCard(
                      vetId: horario.vetId,
                      doctorName: horario.vetName,
                      clinicLocation: horario.branchDirection,
                      doctorImagePath: 'assets/images/${horario.vetName}.jpeg',
                      availableTimeSlots:
                      blocks.map((t) => t.format(context)).toList(),
                      globallySelectedVetId: widget.selectedVetId,
                      globallySelectedHour: widget.selectedHour,
                      onTimeSelected: (selectedTime) {
                        widget.onTimeSelected(horario.vetId, selectedTime);
                        localSetState(() {});
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
