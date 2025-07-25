import 'package:arvivet_app/layout.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; //
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('es_ES', null); // carga símbolos
  Intl.defaultLocale = 'es_ES'; // fija locale global

  await Supabase.initialize(
    url: 'https://earsfeijkxfxdyblnmtx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhcnNmZWlqa3hmeGR5YmxubXR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDMwOTAzODUsImV4cCI6MjA1ODY2NjM4NX0.35WzeIEEBSqNWPPi4t3z0Q8kGA3hi7bJwqTPQvXrpXU',
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
