import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class AboutPets extends StatelessWidget {
  const AboutPets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('Mascotas', style: AppTextStyles.subtitle),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildPetOption(
              icon: Icons.pets,
              label: 'Tus\nMascotas',
              color: AppColors.textColor,
            ),
            buildPetOption(
              icon: Icons.add,
              label: 'Agrega tu\nmascota',
              color: AppColors.primaryGreen,
            ),
          ],
        ),
      ],
    );
  }
}
