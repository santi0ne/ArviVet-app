import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';

class DoctorInfoCard extends StatefulWidget {
  final String doctorName;
  final String clinicLocation;
  final String doctorImagePath;
  final List<String> availableTimeSlots;
  final Function(String) onTimeSelected;

  const DoctorInfoCard({
    super.key,
    required this.doctorName,
    required this.clinicLocation,
    required this.doctorImagePath,
    required this.availableTimeSlots,
    required this.onTimeSelected,
  });

  @override
  State<DoctorInfoCard> createState() => _DoctorInfoCardState();
}

class _DoctorInfoCardState extends State<DoctorInfoCard> {
  String? selectedTime;

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
              widget.doctorImagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.doctorName, style: AppTextStyles.subtitle),
                const SizedBox(height: 4),
                Text(widget.clinicLocation, style: AppTextStyles.muted),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: widget.availableTimeSlots.map((time) {
                    final isSelected = selectedTime == time;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                        widget.onTimeSelected(time);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryBlue
                              : AppColors.primaryGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          time,
                          style: AppTextStyles.button.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
