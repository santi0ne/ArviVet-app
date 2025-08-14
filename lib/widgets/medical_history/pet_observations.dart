import 'package:arvivet_app/models/history_pet.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPetObservations extends StatefulWidget {
  final List<HistoryPet> history;

  const MedicalHistoryPetObservations({super.key, required this.history});

  @override
  State<MedicalHistoryPetObservations> createState() =>
      MedicalHistoryPetObservationState();
}

class MedicalHistoryPetObservationState
    extends State<MedicalHistoryPetObservations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.loupe,
                  size: 20,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Últimas observaciones\nencontradas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.history.isEmpty)
            const Text(
              'No hay Observaciones recientes.',
              style:
                  TextStyle(fontSize: 14, color: AppColors.secBackgroundColor),
            )
          else
            ...widget.history.take(3).map((h) {
              return buildTreatInfo(h.observations);
            }),
        ],
      ),
    );
  }
}
