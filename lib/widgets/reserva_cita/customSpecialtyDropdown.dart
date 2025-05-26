import 'package:arvivet_app/widgets/reserva_cita/specialty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class CustomSpecialtyDropdown extends StatelessWidget {
  final List<Specialty> specialties;
  final Specialty selectedSpecialty;
  final ValueChanged<Specialty?> onChanged;

  const CustomSpecialtyDropdown({
    super.key,
    required this.specialties,
    required this.selectedSpecialty,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Specialty>(
          value: selectedSpecialty,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primaryGreen), // Icono de flecha
          isExpanded: true,
          onChanged: onChanged,
          items: specialties.map((Specialty specialty) {
            return DropdownMenuItem<Specialty>(
              value: specialty,
              child: Row(
                children: [
                  SvgPicture.asset(
                    specialty.iconPath,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(AppColors.primaryGreen, BlendMode.srcIn), // Color del ícono en la lista
                  ),
                  const SizedBox(width: 10),
                  Text(
                    specialty.name,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            );
          }).toList(),
          // Diseño del elemento seleccionado cuando el dropdown no está abierto
          selectedItemBuilder: (BuildContext context) {
            return specialties.map((Specialty specialty) {
              return Row(
                children: [
                  SvgPicture.asset(
                    specialty.iconPath,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(AppColors.primaryGreen, BlendMode.srcIn), // Color del ícono seleccionado
                  ),
                  const SizedBox(width: 10),
                  Text(
                    specialty.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}