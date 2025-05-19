import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.fontColor,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static const TextStyle inputLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.fontColor,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static const TextStyle link = TextStyle(
    fontSize: 18,
    color: AppColors.primaryGreen,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle muted = TextStyle(
    fontSize: 18,
    color: AppColors.textColor,
  );
}

