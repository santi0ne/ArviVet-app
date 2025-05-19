import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_styles.dart';

//boton reutilizable necesita el texto y la funcion
class CustomButton extends StatelessWidget {
  final String description;
  final VoidCallback onPressed;
  final double? width;
  const CustomButton({
    super.key,
    required this.description,
    required this.onPressed,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              elevation: 8,
              shadowColor: AppColors.boxShadowColor,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusButton))),
          onPressed: onPressed,
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
              decoration: TextDecoration.none,
            ),
          )),
    );
  }
}
