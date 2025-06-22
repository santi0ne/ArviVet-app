import 'package:arvivet_app/pages/edit_about.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/widgets/about/header.dart';
import 'package:arvivet_app/widgets/about/personal_info.dart';
import 'package:arvivet_app/widgets/about/pets.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Map<String, String> personalInfo = {
    'nombre': 'Jahir Díaz Cedeño',
    'cedula': '0952060396',
    'correo': 'jaalcede@espol.edu.ec',
    'celular': '+593 98 903 1804',
    'usuario': 'JDC1907',
  };

  void _editarInformacion() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditAboutPage()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        personalInfo = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(label: 'Acerca De'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const AboutHeader(),
              const SizedBox(height: 8),

              AboutPersonalInfo(info: personalInfo),

              const SizedBox(height: 20),
              CustomButton(
                description: 'Editar',
                onPressed: _editarInformacion,
                width: 120,
                primaryColor: AppColors.primaryGreen,
              ),
              const SizedBox(height: 30),
              const AboutPets(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
