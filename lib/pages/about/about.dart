import 'package:arvivet_app/layout.dart';
import 'package:arvivet_app/pages/about/edit_about.dart';
import 'package:arvivet_app/pages/about/my_pets.dart';
import 'package:arvivet_app/services/user_service.dart';
import 'package:arvivet_app/models/user.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/widgets/about/header.dart';
import 'package:arvivet_app/widgets/about/personal_info.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  UserData? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final userId = SessionManager().userId;
    if (userId != null) {
      final fetchedUser = await UserService.fetchUserData(userId);
      setState(() {
        user = fetchedUser;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _editarInformacion() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MainLayout(
                initialIndex: 3,
                overridePage: EditAboutPage(),
              )),
    );

    // Si la edición retorna true, recarga los datos del usuario
    if (result == true) {
      _fetchUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Acerca De',
        onBack: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainLayout()),
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : user == null
                ? const Center(
                    child:
                        Text('No se pudo cargar la información del usuario.'))
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        AboutHeader(name: user!.nombre),
                        const SizedBox(height: 8),
                        AboutPersonalInfo(
                          info: {
                            'nombre': user!.nombre,
                            'correo': user!.correo,
                            'telefono': user!.telefono,
                            'direccion': user!.direccion ?? '',
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              description: 'Editar',
                              onPressed: _editarInformacion,
                              width: 120,
                              primaryColor: AppColors.primaryGreen,
                            ),
                            const SizedBox(width: 20),
                            CustomButton(
                              description: 'Mi Mascota',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainLayout(
                                      initialIndex: 3,
                                      overridePage: MyPetsPage(),
                                    ),
                                  ),
                                );
                              },
                              width: 130,
                              primaryColor: AppColors.textColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
      ),
    );
  }
}
