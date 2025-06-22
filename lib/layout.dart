import 'package:arvivet_app/pages/about/about.dart';
import 'package:arvivet_app/pages/home.dart';
import 'package:arvivet_app/pages/appointments.dart';
import 'package:arvivet_app/pages/schedule_appointment.dart';
import 'package:arvivet_app/utils/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final int initialIndex;
  final Widget? overridePage;

  const MainLayout({super.key, this.initialIndex = 0, this.overridePage});

  @override
  State<StatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int index;

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.calendar_today_rounded,
    Icons.folder_open_rounded,
    Icons.person_rounded,
  ];

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: widget.overridePage ?? getSelectedPage(index: index),
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
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const AppointmentsPage();
      case 2:
        return const AppointmentsPage();
      case 3:
        return const AboutPage();
      default:
        return const HomePage();
    }
  }
}
