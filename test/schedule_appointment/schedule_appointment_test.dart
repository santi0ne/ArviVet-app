import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/pages/schedule_appointment.dart';

void main(){
  group('ScheduleAppointment Widget Tests', (){
    testWidgets('Renderiza correctamente la vista principal',
            (WidgetTester tester) async{
      //carga el widget al test enviroment
      await tester.pumpWidget(
        const MaterialApp(
          home: ScheduleAppointment(),
        ),
      );

      //Verifica que el titulo este presente
      expect(find.text('Escoge la especialidad:'), findsOneWidget);

      //Verifica que el boton agendar cita esta presente
      expect(find.text('Agendar cita'), findsOneWidget);
    });

    testWidgets('Dropdown muestra las especialidades',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: ScheduleAppointment(),
            ),
          );

          //Abre el dropdown al aplastarlo
          final dropdown = find.byKey(const Key('specialty_dropdown'));
          await tester.tap(dropdown);
          await tester.pumpAndSettle();

          //Verifica que las especialidades esten presentes
          expect(find.text('Laboratorio'), findsWidgets);
          expect(find.text('Vacunacion'), findsWidgets);
          expect(find.text('Veterinario'), findsWidgets);

    });

    testWidgets('Calendario aparece solo despues de seleccionar la especialidad',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: ScheduleAppointment(),
            ),
          );

          //Verifica que el calendario no se muestra al inicio
          expect(find.byKey(const Key('custom_calendar')), findsNothing);

          final dropdown = find.byKey(const Key('specialty_dropdown'));
          await tester.tap(dropdown);
          await tester.pumpAndSettle();

          await tester.tap(find.text('Vacunacion').last);
          await tester.pumpAndSettle();

          //Verifica que el calendario ahora sí aparece
          expect(find.byKey(const Key('custom_calendar')), findsOneWidget);

    });
  });
}
