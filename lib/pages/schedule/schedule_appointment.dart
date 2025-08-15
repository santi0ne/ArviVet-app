import 'package:arvivet_app/widgets/schedule_appointment//custom_calendar.dart';
import 'package:arvivet_app/widgets/schedule_appointment/vet_schedule_list.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/schedule_appointment/specialty.dart';
import 'package:arvivet_app/widgets/schedule_appointment/customSpecialtyDropdown.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/schedule_appointment/show_appointment_dialog.dart';
import 'package:arvivet_app/services/appointments_services.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  List<Specialty> _specialties = [];
  Specialty? _selectedSpecialty;
  DateTime? _selectedDate;
  int? _selectedVetId;
  String? _selectedHour;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    AppointmentServices.fetchSpecialties().then((data) {
      setState(() {
        _specialties = data;
        _selectedSpecialty = data.isNotEmpty ? data.first : null;
        _isLoading = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Asignación de Citas',
      ),
      body: _isLoading == false ? const Center(child: CircularProgressIndicator()) :
      SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Escoge la especialidad:',
                style: AppTextStyles.inputLabel),
            const SizedBox(height: 10),

            CustomSpecialtyDropdown(
              specialties: _specialties,
              selectedSpecialty: _selectedSpecialty ?? _specialties.first,
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
                borderRadius: BorderRadius.circular(15)
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

            if (_selectedDate != null && _selectedSpecialty != null)
              VetScheduleList(
                specialityId: _selectedSpecialty!.id,
                selectedDate: _selectedDate!,
                selectedVetId: _selectedVetId,
                selectedHour: _selectedHour,
                onTimeSelected: (vetId, hour) {
                  setState(() {
                    _selectedVetId = vetId;
                    _selectedHour = hour;
                  });
                },
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
