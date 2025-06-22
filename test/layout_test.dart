import 'package:arvivet_app/pages/about/about.dart';
import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/pages/schedule/appointments.dart';
import 'package:arvivet_app/pages/schedule/schedule_appointment.dart';
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
    testWidgets('Render main layout and navbar', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());

      expect(find.byType(MainLayout), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsNothing);
      expect(find.byType(Icon), findsWidgets);
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('Navigate to the Schedule Appointment section', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());
      await tapBottomNavIcon(tester, Icons.calendar_today_rounded);
      expect(find.byType(ScheduleAppointment), findsOneWidget);
    });

    testWidgets('Navigate to the Medical History section', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());
      await tapBottomNavIcon(tester, Icons.folder_open_rounded);
      expect(find.byType(AppointmentsPage), findsOneWidget);
    });

    testWidgets('Navigate to the About me section', (WidgetTester tester) async {
      await loadPage(tester, const MainLayout());
      await tapBottomNavIcon(tester, Icons.person_rounded);
      expect(find.byType(AboutPage), findsOneWidget);
    });
  });
}

