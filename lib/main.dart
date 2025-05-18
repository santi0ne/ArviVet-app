import 'package:flutter/material.dart';
import 'views/log_in.dart';
import 'views/start.dart';

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
      home: StartView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
