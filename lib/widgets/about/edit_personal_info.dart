import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class EditAboutPersonalInfo extends StatefulWidget {
  const EditAboutPersonalInfo({super.key});

  @override
  State<EditAboutPersonalInfo> createState() => EditAboutPersonalInfoState();
}

class EditAboutPersonalInfoState extends State<EditAboutPersonalInfo> {
  final nombreController = TextEditingController();
  final cedulaController = TextEditingController();
  final correoController = TextEditingController();
  final celularController = TextEditingController();
  final usuarioController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    cedulaController.dispose();
    correoController.dispose();
    celularController.dispose();
    usuarioController.dispose();
    super.dispose();
  }

  Map<String, String> getDatos() {
    final datos = {
      'nombre': nombreController.text,
      'cedula': cedulaController.text,
      'correo': correoController.text,
      'celular': celularController.text,
      'usuario': usuarioController.text,
    };

    return datos;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInput('Nombre completo', nombreController),
        buildInput('Cédula', cedulaController),
        buildInput('Correo', correoController),
        buildInput('Celular', celularController),
        buildInput('Usuario', usuarioController),
      ],
    );
  }
}
