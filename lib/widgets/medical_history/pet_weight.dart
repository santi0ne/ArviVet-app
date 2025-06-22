import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPetWeight extends StatelessWidget {
  const MedicalHistoryPetWeight({super.key});

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
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.monitor_weight,
                  size: 20,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Seguimiento de Peso',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              buildWeightPill('4.8kg', '01/2024', Colors.grey[200]!),
              const SizedBox(width: 12),
              buildWeightPill('5.0kg', '02/2024', Colors.grey[200]!),
              const SizedBox(width: 12),
              buildWeightPill('5.2kg', '03/2024', Colors.green[100]!),
            ],
          ),
        ],
      ),
    );
  }
}
