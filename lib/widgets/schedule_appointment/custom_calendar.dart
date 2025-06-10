import 'package:flutter/material.dart';
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








