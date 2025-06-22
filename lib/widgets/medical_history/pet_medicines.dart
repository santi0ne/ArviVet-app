import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPetMedicines extends StatelessWidget {
  const MedicalHistoryPetMedicines({super.key});

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
                  Icons.medication,
                  size: 20,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Medicamentos Actuales',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildMedicationItem(
              'Antiparasitario', 'Cada 3 meses', 'Próxima: 15/06/2024'),
          buildMedicationItem('Vitaminas', 'Diario', 'En curso'),
        ],
      ),
    );
  }
}
