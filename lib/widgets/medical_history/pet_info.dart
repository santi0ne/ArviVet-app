import 'package:arvivet_app/models/pet.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPetInfo extends StatelessWidget {
  final Pet pet;

  const MedicalHistoryPetInfo({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: pet.sex.toLowerCase() == 'macho'
              ? [const Color(0xFF87CEEB), const Color(0xFF4FC3F7)]
              : [const Color(0xFFDA70D6), const Color(0xFFBA55D3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.white.withOpacity(0.3),
              child: const Icon(
                Icons.pets,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: const Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${pet.breed} • ${pet.sex} • ${pet.weigth}kg',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
