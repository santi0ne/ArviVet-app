import 'package:arvivet_app/widgets/schedule_appointment//custom_calendar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/schedule_appointment/specialty.dart';
import 'package:arvivet_app/widgets/schedule_appointment/customSpecialtyDropdown.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/schedule_appointment/doctor_info_card.dart';
import 'package:arvivet_app/widgets/schedule_appointment/show_appointment_dialog.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  static final List<Specialty> fixedSpecialties = [
    Specialty(name: 'Laboratorio', iconPath: 'assets/images/microscopio.svg'),
    Specialty(name: 'Vacunacion', iconPath: 'assets/images/vacuna.svg'),
    Specialty(name: 'Veterinario', iconPath: 'assets/images/veterinario.svg'),
  ];

  Specialty? _selectedSpecialty;
  DateTime? _selectedDate;
  String? _selectedHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Asignación de Citas',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Escoge la especialidad:',
                style: AppTextStyles.inputLabel),
            const SizedBox(height: 10),

            CustomSpecialtyDropdown(
              specialties: fixedSpecialties,
              selectedSpecialty: _selectedSpecialty ?? fixedSpecialties.first,
              onChanged: (Specialty? newSpecialtySelected) {
                if (newSpecialtySelected != null) {
                  setState(() {
                    _selectedSpecialty = newSpecialtySelected;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            Container(
              height: 310,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Builder(
                builder: (context) {
                  return _selectedSpecialty != null
                      ? CustomCalendar(
                          key: const Key('custom_calendar'),
                          initialDate: DateTime.now(),
                          userPickedDate: (fecha) {
                            setState(() {
                              _selectedDate = fecha;
                            });
                          },
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),

            const SizedBox(height: 20),
            Container(
              child: _selectedDate != null
                  ? DoctorInfoCard(
                      doctorName: 'Dr. Nicolas Sierra',
                      clinicLocation: 'Sucursal centro',
                      doctorImagePath: 'assets/images/doctor.jpeg',
                      availableTimeSlots: getAvailableSlotsFor(_selectedDate),
                      onTimeSelected: (time) {
                        setState(() {
                          _selectedHour = time;
                        });
                      },
                    )
                  : const SizedBox.shrink(),
            ),

            const SizedBox(height: 30),
            //_ScheduleButton(),
            Center(
              child: _selectedDate != null && _selectedHour != null
                  ? CustomButton(
                      description: 'Reservar cita',
                      onPressed: () {
                        showAppointmentDialog(
                          context: context,
                          date: _selectedDate!,
                          time: _selectedHour!,
                          speciality: _selectedSpecialty?.name ?? '',
                          vet: 'Dr. Nicolas Sierra',
                          direction: 'Sucursal centro',
                          isConfirmation: true,
                          onConfirm: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cita confirmada.'),
                                backgroundColor: AppColors.primaryGreen,
                              ),
                            );
                          },
                        );
                      },
                      primaryColor: AppColors.primaryGreen,
                      width: 150)
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}

List<String> getAvailableSlotsFor(DateTime? date) {
  if (date == null) return [];
  // Ejemplo fijo para probar
  return ['09:00 AM', '10:30 AM', '01:00 PM', '03:00 PM'];
}
