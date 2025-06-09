import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/layout.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/pages/log_in.dart';
import 'package:arvivet_app/pages/start.dart';
import 'package:arvivet_app/pages/register.dart';
import 'package:intl/date_symbol_data_local.dart'; //
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('es_ES', null); // carga símbolos
  Intl.defaultLocale = 'es_ES'; // fija locale global

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // entry point
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ArviVet App",
      theme: ThemeData(
        fontFamily: 'RobotoFlex',
      ),
      //home: const StartView(),
      supportedLocales: const [Locale('es', 'ES')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    ); // ← close MaterialApp
  } // ← close build()
}

