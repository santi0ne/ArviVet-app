import 'package:flutter_test/flutter_test.dart';
import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/widgets/home/header.dart';
import 'package:arvivet_app/widgets/home/promotions_card.dart';
import 'package:arvivet_app/widgets/home/specialities/specialities.dart';
import 'package:arvivet_app/widgets/home/appointments.dart';

import 'Utils/widget_test_utils.dart';

void main() {
  group('HomePage Widget Test', () {
    testWidgets('Render all primary widgets', (WidgetTester tester) async {
      await loadPage(tester, const HomePage());

      expect(find.byType(HomeHeader), findsOneWidget);
      expect(find.byType(HomePromotions), findsOneWidget);
      expect(find.byType(HomeSpecialities), findsOneWidget);
      expect(find.byType(HomeScheduledAppointments), findsOneWidget);
    });

    testWidgets('Render key texts on HomePromotions', (WidgetTester tester) async {
      await loadPage(tester, const HomePage());

      expect(find.text('Profilaxis\nDental Básica'), findsOneWidget);
      expect(find.text('¡La salud oral de tu mascota es\nimportante!'), findsOneWidget);
      expect(find.text('Separa tu cita'), findsOneWidget);
    });
  });
}
