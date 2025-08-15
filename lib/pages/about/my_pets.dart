import 'package:arvivet_app/models/pet.dart';
import 'package:arvivet_app/services/pet_service.dart';
import 'package:arvivet_app/utils/session_manager.dart';
import 'package:arvivet_app/widgets/about/pets/mypets_card.dart';
import 'package:arvivet_app/widgets/about/pets/mypets_details.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({super.key});

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  Pet? pet;
  // ignore: unused_field
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPetInfo();
  }

  Future<void> _loadPetInfo() async {
    try {
      final userId = SessionManager().userId;
      if (userId == null) throw Exception('No hay usuario autenticado');

      final fetchedPet = await PetService.fetchPetOfCurrentUser(userId);
      if (fetchedPet == null) throw Exception('No se encontró mascota');

      setState(() {
        pet = fetchedPet;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(label: 'Mi Mascota'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [MyPetsCard(pet: pet), MyPetsDetails(pet: pet)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
