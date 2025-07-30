import 'package:arvivet_app/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart'; //
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load();
  final apiUrl = dotenv.env['SUPABASE_URL'];
  final apiKey = dotenv.env['SUPABASE_KEY'];
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('es_ES', null); // carga símbolos
  Intl.defaultLocale = 'es_ES'; // fija locale global

  await Supabase.initialize(
    url: apiUrl ?? '',
    anonKey: apiKey ?? '',
    debug: true,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // entry point
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArviVet App',
      theme: ThemeData(
        fontFamily: 'RobotoFlex',
      ),
      supportedLocales: const [Locale('es', 'ES')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const StartView(),
      debugShowCheckedModeBanner: false,
    ); // ← close MaterialApp
  } // ← close build()
}
