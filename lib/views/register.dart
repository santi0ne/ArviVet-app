import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import '../utils/app_text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_underline_input.dart';


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
        child: SingleChildScrollView( // 🔁 Agrega scroll por si el teclado cubre algo
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botón volver
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),

                const SizedBox(height: 16),

                // Título
                Text('Registro', style: AppTextStyles.title),
                const SizedBox(height: 8),
                Text(
                  'Llena los siguientes campos para crear tu cuenta',
                  style: AppTextStyles.subtitle,
                ),
                const SizedBox(height: 32),

                // Campos de entrada
                CustomUnderlineInput(
                  label: 'Nombre',
                  hintText: 'Ingresa tu nombre',
                  controller: _nameController,
                ),
                const SizedBox(height: 16),
                CustomUnderlineInput(
                  label: 'Correo',
                  hintText: 'Ingresa tu correo',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomUnderlineInput(
                  label: 'Contraseña',
                  hintText: 'Introduce tu contraseña',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 40),

                // Botón Crear Cuenta
                Center(
                child: CustomButton(
                  width: 200, // o el tamaño que desees
                  description: 'Crear Cuenta',
                  onPressed: () {
                    // Acción de registro
                  },
                ),
              ),


                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
