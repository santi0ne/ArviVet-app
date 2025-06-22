import 'package:arvivet_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSpecialitiesItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const HomeSpecialitiesItem({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: AppColors.fontColor,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
