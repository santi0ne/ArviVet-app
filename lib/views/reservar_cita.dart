import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ReservarCita extends StatelessWidget{
  const ReservarCita({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Asignación de citas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF),
            borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset('assets/images/campana_notificacion.svg',
          width: 20,
          height: 20,),
        ),
        
      ),
    );
  }
}