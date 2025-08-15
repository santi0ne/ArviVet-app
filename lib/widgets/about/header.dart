import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutHeader extends StatelessWidget {
  final String name;

  const AboutHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 58,
            backgroundImage: AssetImage('assets/images/pic.jpg'),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Hola, $name!',
          style: AppTextStyles.title,
        ),
      ],
    );
  }
}
