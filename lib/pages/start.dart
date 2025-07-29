import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:arvivet_app/pages/register.dart';
import 'package:arvivet_app/pages/log_in.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo PNG centrado
            Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 300,
            ),

            const SizedBox(height: 34),

            Center(
              child: CustomButton(
                width: 200,
                description: 'Ingresar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                primaryColor: AppColors.primaryGreen,
              ),
            ),

            const SizedBox(height: 22),

            // Texto: ¿No tiene cuenta? / Regístrese aquí
            Column(
              children: [
                const Text(
                  '¿No tiene una cuenta?',
                  style: AppTextStyles.muted,
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterView()),
                    );
                  },
                  child: const Text(
                    'Regístrese aquí',
                    style: AppTextStyles.link,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
