import 'package:arvivet_app/pages/schedule_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> loadScheduleAppointment(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: ScheduleAppointment(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> openDropdown(WidgetTester tester) async {
  final dropdown = find.byKey(const Key('specialty_dropdown'));
  await tester.tap(dropdown);
  await tester.pumpAndSettle();
}

Future<void> selectedSpecialty(WidgetTester tester, String specialtyName) async {
  await openDropdown(tester);
  await tester.tap(find.text(specialtyName).last);
  await tester.pumpAndSettle();
}



