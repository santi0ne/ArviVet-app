import 'package:arvivet_app/pages/schedule_appointment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';


import 'Utils/widget_test_utils.dart';

void main(){
  group('ScheduleAppointment Widget Tests', () {

    testWidgets('Render main schedule appointment view', (WidgetTester tester) async{
      await loadPage(tester, const ScheduleAppointment());

      expect(find.text('Escoge la especialidad:'), findsOneWidget);
      expect(find.text('Agendar cita'), findsOneWidget);
    });

    testWidgets('Dropdown menu shows available specialties', (WidgetTester tester) async {
      await loadPage(tester, const ScheduleAppointment());
      await openDropdown(tester);

      expect(find.text('Laboratorio'), findsWidgets);
      expect(find.text('Vacunacion'), findsWidgets);
      expect(find.text('Veterinario'), findsWidgets);

    });

    testWidgets('Calendar widget appears only after selecting desired specialty',
            (WidgetTester tester) async {
      await loadPage(tester, const ScheduleAppointment());

      expect(find.byKey(const Key('custom_calendar')), findsNothing);

      await selectedSpecialty(tester, 'Vacunacion');

      expect(find.byKey(const Key('custom_calendar')), findsOneWidget);

    });

  });
}
