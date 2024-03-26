import 'package:flutter/material.dart';
import 'package:weather_app/ViewModel/Services/Splash%20Screen/splash_services.dart';

import '../../Resources/Images/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashServices.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageAssets.nightStatRain,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
