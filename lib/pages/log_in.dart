import 'package:arvivet_app/Services/auth_service.dart';
import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/app_sizes.dart';
import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:arvivet_app/widgets/ui/custom_input.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(label: 'Inicio de Sesión'),
      body: SafeArea(
        child: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Imagen del perrito
                  Image.asset(
                    'assets/images/dog_login.png',
                    height: 200,
                  ),

                  const SizedBox(height: 20),

                  // Título
                  const Text(
                    'Inicio de Sesión',
                    style: AppTextStyles.title,
                  ),

                  const SizedBox(height: 30),

                  // Input correo
                  CustomInput(
                    label: 'Correo',
                    hintText: 'usuario@ejemplo.com',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  // Input contraseña con ícono
                  CustomInput(
                    label: 'Contraseña',
                    hintText: 'Introduce tu contraseña',
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
                        description: 'Inicia Sesión',
                        onPressed: () async {
                          try {
                            final usuario = await authService.loginUsuario(
                              correo: _emailController.text.trim(),
                              contrasena: _passwordController.text,
                            );

                            print(
                                'Usuario logueado: ${usuario['nombre']}, rol: ${usuario['rol']}');

                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()),
                            );
                          } catch (e) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                        primaryColor: AppColors.primaryGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
