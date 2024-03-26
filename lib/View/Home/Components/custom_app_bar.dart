import 'package:flutter/material.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.menu,
        ),
        const SizedBox(width: 20),
        const Icon(
          Icons.notifications
        ),
        const Spacer(),
        Image.asset(
          ImageAssets.nightRain,
          height: 30,
          width: 30,
        )
      ]
    );
  }
}