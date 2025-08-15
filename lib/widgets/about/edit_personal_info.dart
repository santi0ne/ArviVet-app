import 'package:arvivet_app/models/user.dart';
import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class EditAboutPersonalInfo extends StatefulWidget {
  final UserData? userData;

  const EditAboutPersonalInfo({
    super.key,
    required this.userData,
  });

  @override
  State<EditAboutPersonalInfo> createState() => EditAboutPersonalInfoState();
}

class EditAboutPersonalInfoState extends State<EditAboutPersonalInfo> {
  late final TextEditingController nombreController;
  late final TextEditingController correoController;
  late final TextEditingController telefonoController;
  late final TextEditingController direccionController;

  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.userData?.nombre ?? '');
    correoController = TextEditingController(text: widget.userData?.correo ?? '');
    telefonoController = TextEditingController(text: widget.userData?.telefono ?? '');
    direccionController = TextEditingController(text: widget.userData?.direccion ?? '');
  }

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    telefonoController.dispose();
    direccionController.dispose();
    super.dispose();
  }

  Map<String, String> getDatos() {
    final datos = {
      'nombre': nombreController.text,
      'correo': correoController.text,
      'celular': telefonoController.text,
      'usuario': direccionController.text,
    };

    return datos;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInput('Nombre completo', nombreController),
        buildInput('Correo', correoController),
        buildInput('Teléfono', telefonoController),
        buildInput('Dirección', direccionController),
      ],
    );
  }
}
