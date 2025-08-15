import 'package:arvivet_app/layout.dart';
import 'package:arvivet_app/models/history_pet.dart';
import 'package:arvivet_app/models/pet.dart';
import 'package:arvivet_app/services/mhistory_service.dart';
import 'package:arvivet_app/services/pet_service.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/widgets/medical_history/pet_treatments.dart';
import 'package:arvivet_app/widgets/medical_history/pet_info.dart';
import 'package:arvivet_app/widgets/medical_history/pet_observations.dart';
import 'package:arvivet_app/widgets/medical_history/pet_recents.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class MedicalHistoryPage extends StatefulWidget {
  const MedicalHistoryPage({super.key});

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  late Pet pet;
  bool _isLoadingPetInfo = true;
  bool _isLoadingHistory = true;
  List<HistoryPet> _history = [];

  @override
  void initState() {
    super.initState();
    _loadPetAndHistory();
  }

  Future<void> _loadPetAndHistory() async {
    try {
      final userId = SessionManager().userId;
      if (userId == null) throw Exception('No hay usuario autenticado');

      final fetchedPet = await PetService.fetchPetOfCurrentUser(userId);
      if (fetchedPet == null) throw Exception('No se encontró mascota');

      setState(() {
        pet = fetchedPet;
        _isLoadingPetInfo = false;
      });

      final fetchedHistory = await HistoryPetServices.fetchHistoryByPet(pet.id);
      if (fetchedHistory.isEmpty) throw Exception('No se encontro historial');
      setState(() {
        _history = fetchedHistory;
        _isLoadingHistory = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingPetInfo = false;
        _isLoadingHistory = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: 'Historial Médico',
        onBack: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainLayout()),
        ),
      ),
      body: SafeArea(
        child: (_isLoadingPetInfo || _isLoadingHistory)
            ? const Center(child: CircularProgressIndicator())
            // ignore: unnecessary_null_comparison
            : (pet == null
                ? const Center(
                    child: Text(
                      'Para ver esta pantalla, debe registrar una mascota',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          MedicalHistoryPetInfo(pet: pet),
                          if (_history.isEmpty)
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: Text(
                                  '${pet.name} no tiene registros de historial para mostrar.',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          else ...[
                            MedicalHistoryRecentVisits(history: _history),
                            MedicalHistoryPetTreatments(history: _history),
                            MedicalHistoryPetObservations(history: _history),
                          ]
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }
}
