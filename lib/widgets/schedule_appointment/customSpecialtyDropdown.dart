import 'package:arvivet_app/widgets/schedule_appointment/specialty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:arvivet_app/utils/app_colors.dart';

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
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.borderColor, width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: AppColors.boxShadowColor,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Specialty>(
          key: const Key('specialty_dropdown'),
          value: selectedSpecialty,
          icon: const Icon(Icons.keyboard_arrow_down,
              color: AppColors.primaryGreen), // Icono de flecha
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
                    colorFilter: const ColorFilter.mode(AppColors.primaryGreen,
                        BlendMode.srcIn), // Color del ícono en la lista
                  ),
                  const SizedBox(width: 10),
                  Text(
                    specialty.name,
                    style: const TextStyle(
                        fontSize: 16, color: AppColors.fontColor),
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
                    colorFilter: const ColorFilter.mode(AppColors.primaryGreen,
                        BlendMode.srcIn), // Color del ícono seleccionado
                  ),
                  const SizedBox(width: 10),
                  Text(
                    specialty.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.fontColor),
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
