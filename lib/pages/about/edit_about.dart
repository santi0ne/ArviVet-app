import 'package:arvivet_app/models/user.dart';
import 'package:arvivet_app/services/user_service.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/widgets/about/edit_personal_info.dart';
import 'package:arvivet_app/widgets/about/header.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:arvivet_app/widgets/ui/custom_button.dart';
import 'package:flutter/material.dart';

class EditAboutPage extends StatefulWidget {
  const EditAboutPage({super.key});

  @override
  State<EditAboutPage> createState() => _EditAboutPageState();
}

class _EditAboutPageState extends State<EditAboutPage> {
  final GlobalKey<EditAboutPersonalInfoState> personalInfoKey = GlobalKey();
  UserData? userData;
  bool isLoading = true;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userId = SessionManager().userId;
    if (userId != null) {
      final fetchedUser = await UserService.fetchUserData(userId);
      setState(() {
        userData = fetchedUser;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _hasChanged(Map<String, String> datos) {
    if (userData == null) return false;
    return (datos['nombre'] ?? '') != (userData!.nombre) ||
        (datos['correo'] ?? '') != (userData!.correo) ||
        (datos['telefono'] ?? '') != (userData!.telefono) ||
        (datos['direccion'] ?? '') != (userData!.direccion ?? '');
  }

  Future<void> _guardarCambios() async {
    final datos = personalInfoKey.currentState?.getDatos();

    if (datos == null) return;

    if (!_hasChanged(datos)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sin cambios'),
          content: const Text('No se han realizado cambios en la información.'),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      isSaving = true;
    });

    final userId = SessionManager().userId;
    bool success = false;
    String errorMsg = '';
    if (userId != null) {
      try {
        // Mapear los datos correctamente para updateUserData
        final updateData = {
          'nombre': datos['nombre'] ?? '',
          'correo': datos['correo'] ?? '',
          'telefono': datos['celular'] ?? '',
          'direccion': datos['usuario'] ?? '',
        };
        success = await UserService.updateUserData(userId, updateData);
        SessionManager().updateName(updateData['nombre']!);
      } catch (e) {
        errorMsg = e.toString();
      }
    }

    setState(() {
      isSaving = false;
    });

    if (success) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Información Actualizada'),
          content: const Text('Los datos se han actualizado correctamente.'),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(errorMsg.isNotEmpty
              ? errorMsg
              : 'No se pudo actualizar la información.'),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(label: 'Acerca De'),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : userData == null
                ? const Center(
                    child:
                        Text('No se pudo cargar la información del usuario.'))
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        AboutHeader(name: userData!.nombre),
                        const SizedBox(height: 8),
                        EditAboutPersonalInfo(
                          key: personalInfoKey,
                          userData: userData,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                description:
                                    isSaving ? 'Guardando...' : 'Guardar',
                                onPressed: isSaving
                                    ? null
                                    : () {
                                        _guardarCambios();
                                      },
                                width: 120,
                                primaryColor: AppColors.primaryGreen,
                              ),
                              const SizedBox(width: 20),
                              CustomButton(
                                description: 'Cancelar',
                                onPressed: isSaving
                                    ? null
                                    : () => Navigator.pop(context),
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
