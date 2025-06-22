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

  Widget buildInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              isDense: true,
            ),
          ),
        ],
      ),
    );
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
