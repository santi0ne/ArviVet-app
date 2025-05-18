import 'package:arvivet_app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../utils/app_colors.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.padding),
                child: CustomButton(
                    description: "Ingresar Ahora",
                    onPressed: () {
                      print("HOla");
                    }),
              ),
              const SizedBox(height: 40),
            ],
          )
        ],
      ),
    );
  }
}
