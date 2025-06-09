import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';

class DoctorInfoCard extends StatelessWidget {
  final String doctorName;
  final String clinicLocation;
  final String doctorImagePath;
  final List<String> availableTimeSlots;

  const DoctorInfoCard({
    super.key,
    required this.doctorName,
    required this.clinicLocation,
    required this.doctorImagePath,
    required this.availableTimeSlots,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.boxShadowColor,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              doctorImagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),


          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName, style: AppTextStyles.subtitle),
                  const SizedBox(height: 4),
                  Text(clinicLocation, style: AppTextStyles.muted),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: availableTimeSlots.map((time) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          time,
                          style: AppTextStyles.button
                        ),
                      );
                    }).toList(),
                  )
                ],
              )
          )

        ],
      ),
    );
  }
}