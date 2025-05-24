import 'package:flutter/material.dart';

class ReservarCita extends StatelessWidget{
  const ReservarCita({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Asignación de citas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}