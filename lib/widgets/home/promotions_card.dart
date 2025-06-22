import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class HomePromotions extends StatelessWidget {
  const HomePromotions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      height: 205,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.textColor,
            Color(0xFF4A90A4),
          ],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profilaxis\nDental Básica',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '¡La salud oral de tu mascota es\nimportante!',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      foregroundColor: const Color(0xFF4A90A4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text(
                      'Separa tu cita',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          // imagen de perro
          Positioned(
            right: 10,
            top: 45,
            child: SizedBox(
              width: 140,
              height: 160,
              child: Image.asset(
                'assets/images/perro-dientes.png',
                fit: BoxFit.cover,
              ), 
            ),
          ),
          
          // Page indicators
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: index == 0 ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == 0 ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
    );
  }
}