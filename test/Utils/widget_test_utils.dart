import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> loadPage(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(
    MaterialApp(home: widget),
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

Future<void> tapBottomNavIcon(WidgetTester tester, IconData icon) async {
  final finder = find.byIcon(icon);
  expect(finder, findsOneWidget, reason: 'No se encontró el ícono $icon en el BottomNavigationBar');
  await tester.tap(finder);
  await tester.pumpAndSettle();
}





