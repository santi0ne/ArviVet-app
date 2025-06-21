import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class AboutPersonalInfo extends StatelessWidget {
  const AboutPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Información personal',
            style: AppTextStyles.subtitle,
          ),
        ),

        const SizedBox(height: 16),

        buildInfoRow('Nombre completo', 'Jahir Díaz Cedeño'),
        buildInfoRow('Cédula', '0952060396'),
        buildInfoRow('Correo electrónico', 'jaalcede@espol.edu.ec'),
        buildInfoRow('Celular', '+593 98 903 1804'),
        buildInfoRow('Usuario', 'JDC1907'),
      ],
    );
  }
}