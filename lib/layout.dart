import 'package:arvivet_app/pages/about.dart';
import 'package:arvivet_app/pages/medicalHistory.dart';
import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/pages/schedule.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:arvivet_app/pages/schedule_appointment.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<StatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.calendar_today_rounded,
    Icons.folder_open_rounded,
    Icons.person_rounded,
  ];

  int index = 0; // comienza en la pagina de home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        child: getSelectedPage(index: index),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: List.generate(icons.length, (i) {
          final isSelected = i == index;
          return Icon(
            icons[i],
            size: 30,
            color: isSelected ? AppColors.primaryGreen : AppColors.whiteColor,
          );
        }),
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        height: 60,
        backgroundColor: AppColors.whiteColor,
        color: AppColors.textColor,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget getSelectedPage({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomePage();
        break;
      case 1:
        widget = const ScheduleAppointment();
        break;
      case 2:
        widget = const VetHistorialPage();
        break;
      case 3:
        widget = const AboutPage();
        break;
      default:
        widget = const HomePage();
        break;
    }
    return widget;
  }
}
