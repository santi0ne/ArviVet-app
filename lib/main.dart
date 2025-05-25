import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/layout.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/pages/log_in.dart';
import 'package:arvivet_app/pages/start.dart';
import 'package:arvivet_app/pages/register.dart';


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
      //home: const StartView(),
      home: const MainLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}


