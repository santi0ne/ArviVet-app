import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/reserva_cita/specialty.dart'

class ReservarCita extends StatefulWidget {
  const ReservarCita({super.key});

  @override
  State<ReservarCita> createState() => _ReservarCitaState();
}

class _ReservarCitaState extends State<ReservarCita>{

  final List<String> _dropDownItems = ['Laboratorio', 'Vacunacion', 'Imagenes'];
  String _selectedItem = 'Laboratorio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: DropdownButton(
          value: _selectedItem, 
          items: _dropDownItems.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? value){
            setState(() {
              _selectedItem = value!;
            });
          },

          iconEnabledColor: AppColors.primaryGreen,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
        ),
      )

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
            'assets/images/reserva_cita/flecha_atras.svg',
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
              'assets/images/reserva_cita/campana_notificacion.svg',
              width: 20,
              height: 20,

             
            ),
          ),
        ),
      ],
    );
  }
}