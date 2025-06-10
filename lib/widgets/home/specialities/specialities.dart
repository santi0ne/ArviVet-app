import 'package:arvivet_app/widgets/home/specialities/spec_items.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSpecialities extends StatelessWidget {
  const HomeSpecialities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Especialidades',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.fontColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            children: const [
              HomeSpecialitiesItem(icon: Icons.biotech, title: 'Laboratorio', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.medical_services, title: 'Profilaxis', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.pets, title: 'Consulta general', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.content_cut, title: 'Peluquería', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.healing, title: 'Desparasitación', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.local_hospital, title: 'Cirugía', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.vaccines, title: 'Vacunas', color: AppColors.primaryGreen),
              HomeSpecialitiesItem(icon: Icons.restaurant, title: 'Alimentos', color: AppColors.primaryGreen),
            ],

          ),
        ),
      ],
    );
  }
}