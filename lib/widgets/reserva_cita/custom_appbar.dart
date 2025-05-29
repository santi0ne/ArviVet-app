import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNotification;

  const CustomAppBar({
    super.key,
    this.onBack,
    this.onNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Asignación de citas',
        style: AppTextStyles.subtitle,
      ),
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: onBack ?? () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/images/flecha_atras.svg',
            width: 20,
            height: 20,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onNotification,
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/images/campana_notificacion.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  // Necesario para que funcione correctamente en Scaffold
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
