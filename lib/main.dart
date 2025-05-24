import 'package:flutter/material.dart';
import 'package:arvivet_app/views/log_in.dart';
import 'package:arvivet_app/views/start.dart';
import 'package:arvivet_app/views/register.dart';
import 'package:arvivet_app/views/reservar_cita.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//entry point
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ArviVet App",
      theme: ThemeData(
        fontFamily: 'RobotoFlex', 
      ),
      home: ReservarCita(),
      debugShowCheckedModeBanner: false,
    );
  }
}


