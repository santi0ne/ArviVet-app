import 'package:arvivet_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/utils/app_colors.dart';

Future<void> showAppointmentDialog({
  required BuildContext context,
  required DateTime date,
  required String time,
  required String type,
  required String doctor,
  required String location,
  bool isConfirmation = false,
  VoidCallback? onConfirm,
}) {
  final String title =
      isConfirmation ? '¿Desea confirmar la cita?' : 'Detalle de la cita';
  final String? confirmButtonLabel = isConfirmation ? 'Confirmar cita' : null;

  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('📅 Fecha: ${date.day}/${date.month}/${date.year}'),
          Text('⏰ Hora: $time'),
          Text('🩺 Tipo: $type'),
          Text('👨‍⚕️ Doctor: $doctor'),
          Text('📍 Lugar: $location'),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Cerrar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        if (isConfirmation && onConfirm != null)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
            ),
            child: Text(confirmButtonLabel!, style: AppTextStyles.button),
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
          ),
      ],
    ),
  );
}
