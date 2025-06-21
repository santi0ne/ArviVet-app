import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/widgets/about/header.dart';
import 'package:arvivet_app/widgets/about/personal_info.dart';
import 'package:arvivet_app/widgets/about/pets.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: 'Acerca De',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              const AboutHeader(),

              const SizedBox(height: 8),

              const AboutPersonalInfo(),

              const SizedBox(height: 20),

              CustomButton(description: 'Editar', onPressed: (){}, width: 120,primaryColor: AppColors.primaryGreen),

              const SizedBox(height: 30),

              const AboutPets(),

              const SizedBox(height: 40), // espacio final
            ],
          ),
        ),
      ),
    );
  }
  
}
