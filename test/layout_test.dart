import 'package:arvivet_app/pages/about.dart';
import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/pages/medicalHistory.dart';
import 'package:arvivet_app/pages/schedule_appointment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/layout.dart';
import 'Utils/widget_test_utils.dart';
import 'package:intl/date_symbol_data_local.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initializeDateFormatting('es', null); // 👈 carga los datos del locale español
  });
  group('Layout page tests', (){
    testWidgets('Renderiza MainLayout y navbar correctamente', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());

      expect(find.byType(MainLayout), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsNothing);
      expect(find.byType(Icon), findsWidgets);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('Navega a ScheduleAppointment al tocar el icono de calendario', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());
      await tapBottomNavIcon(tester, Icons.calendar_today_rounded);
      expect(find.byType(ScheduleAppointment), findsOneWidget);
    });

    testWidgets('Navega a VetHistorialPage al tocar ícono de carpeta', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());
      await tapBottomNavIcon(tester, Icons.folder_open_rounded);
      expect(find.byType(VetHistorialPage), findsOneWidget);
    });

    testWidgets('Navega a AboutPage al tocar ícono de persona', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());
      await tapBottomNavIcon(tester, Icons.person_rounded);
      expect(find.byType(AboutPage), findsOneWidget);
    });
  });
}

