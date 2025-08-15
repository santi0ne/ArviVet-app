import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class AboutPersonalInfo extends StatelessWidget {
  final Map<String, String> info;

  const AboutPersonalInfo({super.key, required this.info});

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
        buildInfoRow('Nombre completo', info['nombre'] ?? ''),
        buildInfoRow('Correo electrónico', info['correo'] ?? ''),
        buildInfoRow('Teléfono', info['telefono'] ?? ''),
        buildInfoRow('Dirección', info['direccion'] ?? ''),
      ],
    );
  }
}
