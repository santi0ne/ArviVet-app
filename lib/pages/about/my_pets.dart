import 'package:arvivet_app/widgets/about/pets/mypets_card.dart';
import 'package:arvivet_app/widgets/about/pets/mypets_details.dart';
import 'package:arvivet_app/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyPetsPage extends StatelessWidget {
  const MyPetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(label: 'Mis Mascotas'),
        body: Column(
          children: [
            // Pet Cards and Details
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [MyPetsCard(), MyPetsDetails()],
                ),
              ),
            ),
          ],
        ));
  }
}
