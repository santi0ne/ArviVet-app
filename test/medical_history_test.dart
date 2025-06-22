import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arvivet_app/pages/medicalHistory.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Utils/widget_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initializeDateFormatting('es_ES', null);
  });

  group('VetHistorialPage Tests', () {
    testWidgets('Renderiza los componentes principales', (WidgetTester tester) async {
      await loadPage(tester, const VetHistorialPage());


      expect(find.text('Historial de citas'), findsOneWidget);
      expect(find.byType(CupertinoSlidingSegmentedControl<int>), findsOneWidget);
      expect(find.text('Filtrar por fecha'), findsOneWidget);

      expect(find.text('Desparasitación'), findsOneWidget);
      expect(find.text('Vacuna'), findsOneWidget);
    });

    testWidgets('Cambia a sección Completadas al seleccionar el slider', (WidgetTester tester) async {
      await loadPage(tester, const VetHistorialPage());


      final completedTab = find.text('Completadas');
      expect(completedTab, findsOneWidget);
      await tester.tap(completedTab);
      await tester.pumpAndSettle();


      expect(find.text('Laboratorio'), findsWidgets);
      expect(find.text('Vacuna'), findsNothing);
    });

    testWidgets('Cambia de vuelta a Próximas desde Completadas', (WidgetTester tester) async {
      await loadPage(tester, const VetHistorialPage());


      await tester.tap(find.text('Completadas'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Próximas'));
      await tester.pumpAndSettle();


      expect(find.text('Vacuna'), findsOneWidget);
      expect(find.text('Laboratorio'), findsNothing);
    });
  });
}
