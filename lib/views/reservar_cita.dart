import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/reserva_cita/specialty.dart';
import '../widgets/reserva_cita/customSpecialtyDropdown.dart';

class ReservarCita extends StatefulWidget {
  const ReservarCita({super.key});

  @override
  State<ReservarCita> createState() => _ReservarCitaState();
}

class _ReservarCitaState extends State<ReservarCita>{

  final List<Specialty> _specialties = [
    Specialty(name: 'Laboratorio', iconPath: 'assets/images/microscopio.svg'),
    Specialty(name: 'Vacunacion', iconPath: 'assets/images/vacuna.svg'),
    Specialty(name: 'Veterinario', iconPath: 'assets/images/veterinario.svg'),
    // Agrega más especialidades aquí con sus respectivas rutas de SVG
  ];

  late Specialty _selectedSpecialty;

  @override
  void initState(){
    super.initState();
    _selectedSpecialty = _specialties.first; //Inicializa el dropdown con el primer elemento
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView( // Usar SingleChildScrollView para evitar overflow si el contenido crece
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escoge la especialidad:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            // 2. Usando el CustomDropdown
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
            // Puedes añadir más contenido aquí debajo del dropdown
            const SizedBox(height: 30),
            Center(
              child: Text(
                'Especialidad seleccionada: ${_selectedSpecialty.name}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Placeholder para el calendario y la información del doctor
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: const Text('Aquí iría el calendario', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: const Text('Aquí iría la información del doctor', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para agendar cita
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen, // Usa tu color primario
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Agendar cita',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }


  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Asignación de citas',
        style: TextStyle(
            color: Colors.black, 
            fontSize: 18, 
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          // Acción para el botón de atrás
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF), 
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/images/flecha_atras.svg',
            width: 20,
            height: 20,
            color: Colors.black
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Acción para el botón de notificación
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF), 
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/images/campana_notificacion.svg',
              width: 20,
              height: 20,

             
            ),
          ),
        ),
      ],
    );
  }
}