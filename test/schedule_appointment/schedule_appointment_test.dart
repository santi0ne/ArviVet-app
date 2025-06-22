import 'package:arvivet_app/widgets/schedule_appointment/doctor_info_card.dart';
import 'package:arvivet_app/widgets/schedule_appointment/specialty.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';


import '../Utils/widget_test_utils.dart';

void main(){
  group('ScheduleAppointment Widget Tests', () {

    testWidgets('Renderiza correctamente la vista principal', (WidgetTester tester) async{
      await loadScheduleAppointment(tester);

      expect(find.text('Escoge la especialidad:'), findsOneWidget);
      expect(find.text('Agendar cita'), findsOneWidget);
    });

    testWidgets('Dropdown muestra las especialidades', (WidgetTester tester) async {
      await loadScheduleAppointment(tester);
      await openDropdown(tester);

      expect(find.text('Laboratorio'), findsWidgets);
      expect(find.text('Vacunacion'), findsWidgets);
      expect(find.text('Veterinario'), findsWidgets);

    });

    testWidgets('Calendario aparece solo despues de seleccionar la especialidad',
            (WidgetTester tester) async {
      await loadScheduleAppointment(tester);

      expect(find.byKey(const Key('custom_calendar')), findsNothing);

      await selectedSpecialty(tester, 'Vacunacion');

      expect(find.byKey(const Key('custom_calendar')), findsOneWidget);

    });

  });
}
