import 'package:flutter/material.dart';
import '../widgets/custom_input.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_styles.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),
              Text('Registro', style: AppTextStyles.title),
              const SizedBox(height: 8),
              Text(
                'Llena los siguientes campos\npara crear tu cuenta',
                style: AppTextStyles.subtitle,
              ),
              const SizedBox(height: 32),
              CustomInput(
                label: 'Nombre',
                hintText: 'John Wick',
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Correo',
                hintText: 'hey@tuemail.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Contraseña',
                hintText: 'Introduce tu contraseña',
                controller: _passwordController,
                obscureText: true,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppSizes.buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    // Acción de registro
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusButton),
                    ),
                  ),
                  child: Text('Crear Cuenta', style: AppTextStyles.button),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
