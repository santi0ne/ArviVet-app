import 'package:arvivet_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget{
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationBar> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.calendar_today,
    Icons.folder_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor
        ),
        child: CustomPaint(
          painter: NavigationPainter(),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_icons.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                        ? AppColors.textColor
                        : AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _icons[index],
                      color: _selectedIndex == index
                        ? AppColors.whiteColor
                        : AppColors.whiteColor,
                      size: 28,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
  
}

class NavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.whiteColor
      ..style = PaintingStyle.fill;

      final path = Path();

      path.moveTo(0, 20);

      path.quadraticBezierTo(
        size.width * 0.25, 0,
        size.width * 0.5, 0,
      );
      path.quadraticBezierTo(
        size.width * 0.75, 0,
        size.width, 20,
      );

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      canvas.drawPath(path, paint);
  }

   @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
  
}