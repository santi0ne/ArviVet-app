import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_sizes.dart';

//boton reutilizable necesita el texto y la funcion
class CustomButton extends StatelessWidget {
  final String description;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color primaryColor;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.description,
    required this.onPressed,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? AppSizes.buttonHeight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              elevation: 8,
              shadowColor: AppColors.boxShadowColor,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusButton))),
          onPressed: onPressed,
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
              decoration: TextDecoration.none,
            ),
          )),
    );
  }
}
