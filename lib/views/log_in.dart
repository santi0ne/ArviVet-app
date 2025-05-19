import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ← Botón atrás (opcional)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Imagen del perrito
              Image.asset(
                'assets/images/dog_login.png',
                height: 200,
              ),

              const SizedBox(height: 20),

              // Título
              const Text(
                "Inicio de Sesión",
                style: AppTextStyles.title,
              ),

              const SizedBox(height: 30),

              // Input correo
              CustomInput(
                label: "Correo",
                hintText: "usuario@ejemplo.com",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // Input contraseña con ícono
              CustomInput(
                label: "Contraseña",
                hintText: "Introduce tu contraseña",
                controller: _passwordController,
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.borderColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),

              const SizedBox(height: 40),

              // Botón iniciar sesión
              Center(
                child: SizedBox(
                  width: 240,
                  child: CustomButton(
                    description: "Inicia Sesión",
                    onPressed: () {
                      // Acción al iniciar sesión
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
