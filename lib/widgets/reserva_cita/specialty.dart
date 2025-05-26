import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Asegúrate de que estas rutas sean correctas para tu proyecto
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';

// 1. Modelo de datos para las especialidades
class Specialty {
  final String name;
  final String iconPath;

  Specialty({required this.name, required this.iconPath});
}