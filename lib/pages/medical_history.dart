import 'package:arvivet_app/widgets/medical_history/pet_allergies.dart';
import 'package:arvivet_app/widgets/medical_history/pet_info.dart';
import 'package:arvivet_app/widgets/medical_history/pet_medicines.dart';
import 'package:arvivet_app/widgets/medical_history/pet_recents.dart';
import 'package:arvivet_app/widgets/medical_history/pet_vaccines.dart';
import 'package:arvivet_app/widgets/medical_history/pet_vets.dart';
import 'package:arvivet_app/widgets/medical_history/pet_weight.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPage extends StatelessWidget {
  const MedicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(label: 'Historial Médico'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                MedicalHistoryPetInfo(),
                MedicalHistoryPetVaccines(),
                MedicalHistoryRecentVisits(),
                MedicalHistoryPetMedicines(),
                MedicalHistoryPetWeight(),
                MedicalHistoryPetAllergies(),
                MedicalHistoryPetVets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
