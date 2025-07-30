import 'package:arvivet_app/services/auth_service.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:arvivet_app/widgets/ui/custom_underline_input.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final authService = AuthService();

  RegisterForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Llena los siguientes campos para crear tu cuenta',
          style: AppTextStyles.subtitle,
        ),
        const SizedBox(height: 16),
        CustomUnderlineInput(
          label: 'Nombre',
          hintText: 'Ingresa tu nombre',
          controller: nameController,
        ),
        const SizedBox(height: 16),
        CustomUnderlineInput(
            label: 'Teléfono',
            hintText: 'Ingresa tu número de teléfono',
            controller: phoneController),
        const SizedBox(height: 16),
        CustomUnderlineInput(
            label: 'Dirección',
            hintText: 'Ingresa tu dirección',
            controller: addressController),
        const SizedBox(height: 16),
        CustomUnderlineInput(
            label: 'Correo electrónico',
            hintText: 'Ingresa tu correo electrónico',
            controller: emailController),
        const SizedBox(height: 16),
        CustomUnderlineInput(
            label: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            controller: passwordController),
        const SizedBox(height: 16),
        CustomUnderlineInput(
            label: 'Confirmar contraseña',
            hintText: 'Ingresa tu contraseña nuevamente',
            controller: confirmPasswordController),
        const SizedBox(height: 40),
        Center(
          child: CustomButton(
              description: 'Crear cuenta',
              onPressed: () async {
                try {
                  await authService.registrarUsuario(
                    nombre: nameController.text.trim(),
                    correo: emailController.text.trim(),
                    contrasena: passwordController.text,
                    telefono: phoneController.text.trim(),
                    direccion: addressController.text.trim(),
                  );

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Usuario registrado correctamente')),
                  );

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              primaryColor: AppColors.primaryGreen),
        )
      ],
    );
  }
}
