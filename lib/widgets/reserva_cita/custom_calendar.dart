import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'custom_calendar_state.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime? initialDate; //Esto servira si la fecha de cita mas cercana es en muchos dias desde ahora
  final Function(DateTime?) userPickedDate;

  const CustomCalendar({
    super.key,
    this.initialDate,
    required this.userPickedDate,
  });

  @override
  State<CustomCalendar> createState() => CustomCalendarState();
}








