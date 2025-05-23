import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_styles.dart';
import '../widgets/custom_button.dart';
import '../views/register.dart';
import '../views/log_in.dart';

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

            // Botón "Ingresar"
            Center( // ✅ centra el botón sin obligar a ocupar todo el ancho
              child: CustomButton(
                width: 200, // o el tamaño que quieras
                description: "Ingresar",
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
                },
              ),
            ),

            const SizedBox(height: 22),

            // Texto: ¿No tiene cuenta? / Regístrese aquí
            Column(
              children: [
                const Text(
                  "¿No tiene una cuenta?",
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
                    "Regístrese aquí",
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
