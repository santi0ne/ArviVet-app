import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime?
      initialDate; //Esto servira si la fecha de cita mas cercana es en muchos dias desde ahora
  final Function(DateTime?) userPickedDate;

  const CustomCalendar({
    super.key,
    this.initialDate,
    required this.userPickedDate,
  });

  @override
  State<CustomCalendar> createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  List<DateTime?> _selectedDatesToShow = [];
  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      _selectedDatesToShow = [widget.initialDate];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.single,
          selectedDayHighlightColor: AppColors.primaryGreen,
          weekdayLabels: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
          weekdayLabelTextStyle: AppTextStyles.muted,
          firstDayOfWeek: 1,
          selectedDayTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          controlsTextStyle: AppTextStyles.hint,
          disabledDayTextStyle: const TextStyle(color: Colors.grey),
          currentDate: widget.initialDate ?? DateTime.now(),
          disableVibration: true,
          disableMonthPicker: true),
      value: _selectedDatesToShow,
      onValueChanged: (dates) {
        final DateTime? newSelectedDate = dates.isNotEmpty ? dates.first : null;
        setState(() {
          _selectedDatesToShow = dates;
        });
        widget.userPickedDate(newSelectedDate);
      },
    );
  }
}

