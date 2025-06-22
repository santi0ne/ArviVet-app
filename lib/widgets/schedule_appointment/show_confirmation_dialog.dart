import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:arvivet_app/utils/app_colors.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required DateTime dateTime,
  required String type,
  required String doctor,
  required String location,
}) {
  final dateFmt = DateFormat('dd MMMM yyyy', 'es_ES');
  final timeFmt = DateFormat('HH:mm a', 'es_ES');

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text('Detalle de la cita'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('📅 Fecha: ${dateFmt.format(dateTime)}'),
          Text('⏰ Hora: ${timeFmt.format(dateTime).toUpperCase()}'),
          Text('🩺 Tipo: $type'),
          Text('👨‍⚕️ Doctor: $doctor'),
          Text('📍 Lugar: $location'),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
