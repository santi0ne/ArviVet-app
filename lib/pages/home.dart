import 'package:arvivet_app/widgets/home/appointments.dart';
import 'package:arvivet_app/widgets/home/header.dart';
import 'package:arvivet_app/widgets/home/promotions_card.dart';
import 'package:arvivet_app/widgets/home/specialities/specialities.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header
            HomeHeader(),
            SizedBox(height: 10),

            // Promotional Card
            HomePromotions(),
            SizedBox(height: 30),

            // seccion de especialidades
            HomeSpecialities(),
            SizedBox(height: 30),

            // seccion de citas agendadas
            HomeScheduledAppointments(),
            // const SizedBox(height: 100),

          ],
        ),
      )),
    );
  }

}