import 'package:arvivet_app/widgets/reserva_cita/custom_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/reserva_cita/specialty.dart';
import '../widgets/reserva_cita/customSpecialtyDropdown.dart';
import 'package:arvivet_app/widgets/reserva_cita/custom_appbar.dart';


class ReservarCita extends StatefulWidget {
  const ReservarCita({super.key});

  @override
  State<ReservarCita> createState() => _ReservarCitaState();
}

class _ReservarCitaState extends State<ReservarCita> {
  final List<Specialty> _specialties = [
    Specialty(name: 'Laboratorio', iconPath: 'assets/images/microscopio.svg'),
    Specialty(name: 'Vacunacion', iconPath: 'assets/images/vacuna.svg'),
    Specialty(name: 'Veterinario', iconPath: 'assets/images/veterinario.svg'),
  ];

  late Specialty _selectedSpecialty;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedSpecialty = _specialties.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Escoge la especialidad:', style: AppTextStyles.inputLabel),
            const SizedBox(height: 10),

            CustomSpecialtyDropdown(
              specialties: _specialties,
              selectedSpecialty: _selectedSpecialty,
              onChanged: (Specialty? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedSpecialty = newValue;
                  });
                }
              },
            ),

            const SizedBox(height: 30),

            Center(
              child: Text(
                'Especialidad seleccionada: ${_selectedSpecialty.name}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: CustomCalendar(
                initialDate: DateTime.now(),
                userPickedDate: (fecha) {
                  setState(() {
                    _selectedDate = fecha;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),
            _DoctorInfoCard(),
            const SizedBox(height: 20),
            _ScheduleButton(),
          ],
        ),
      ),
    );
  }
}


class _DoctorInfoCard extends StatelessWidget {
  const _DoctorInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Aquí iría la información del doctor',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class _ScheduleButton extends StatelessWidget {
  const _ScheduleButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Acción para agendar cita
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryGreen,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Agendar cita',
          style: AppTextStyles.button,
        ),
      ),
    );
  }
}
