import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/widgets/about/edit_personal_info.dart';
import 'package:arvivet_app/widgets/about/header.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';

class EditAboutPage extends StatelessWidget {
  const EditAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<EditAboutPersonalInfoState> personalInfoKey = GlobalKey();

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

              /// ⬇️ Pasamos el key para acceder desde el botón
              EditAboutPersonalInfo(key: personalInfoKey),

              const SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      description: 'Guardar',
                      onPressed: () {
                        final datos = personalInfoKey.currentState?.getDatos();

                        if (datos != null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Información Actualizada'),
                              content: const Text(
                                  'Los datos se han actualizado correctamente.'),
                              actions: [
                                TextButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () => {
                                    Navigator.pop(context),
                                    Navigator.pop(context, datos)
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      width: 120,
                      primaryColor: AppColors.primaryGreen,
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      description: 'Cancelar',
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                      primaryColor: AppColors.errorBorderColor,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
