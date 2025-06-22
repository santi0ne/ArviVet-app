import 'package:arvivet_app/utils/general.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPetVaccines extends StatelessWidget {
  const MedicalHistoryPetVaccines({super.key});

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
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.vaccines,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Vacunas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildVaccinationItem(
              'Rabia', '15/03/2024', 'Completada', Colors.green),
          buildVaccinationItem(
              'DHPP', '20/02/2024', 'Completada', Colors.green),
          buildVaccinationItem(
              'Bordetella', '25/04/2024', 'Pendiente', Colors.orange),
        ],
      ),
    );
  }
}
