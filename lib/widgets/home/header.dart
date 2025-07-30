import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/services/auth_service.dart';
import 'package:arvivet_app/pages/start.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionManager = SessionManager();
    final userName = sessionManager.nombre ?? 'Usuario';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              border: Border.all(color: Colors.grey[400]!, width: 2),
            ),
            child: const CircleAvatar(
              radius: 58,
              backgroundImage: AssetImage('assets/images/pic.jpg'),
            ),
          ),
          const SizedBox(width: 15),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Hola, $userName!',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Nos alegramos de volver a verte.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // Logout Button
          GestureDetector(
            onTap: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cerrar Sesión'),
                    content: const Text('¿Estás seguro de que deseas cerrar sesión?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Cerrar Sesión'),
                      ),
                    ],
                  );
                },
              );

              if (shouldLogout == true) {
                try {
                  final authService = AuthService();
                  await authService.logoutUsuario();

                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const StartView()),
                      (route) => false,
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al cerrar sesión: $e')),
                    );
                  }
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.logout,
                size: 28,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
