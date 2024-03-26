import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/View/Home/Components/small_container.dart';
import 'package:weather_app/ViewModel/Controller/days_controller.dart';
import 'package:weather_app/ViewModel/Controller/home_controller.dart';

class SmallContainerList extends StatelessWidget {

  final controller = Get.put(DaysController());
  final homeController = Get.put(HomeController());

  SmallContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => SmallContainer(text: '${controller.day.value.precipprob!.toInt()}%', image: ImageAssets.heavyRain, textColor: Colors.white, backgroundColor: Colors.white30,)),
        Obx(() => SmallContainer(text: '${controller.day.value.windspeed!.toInt()}km/h', image: ImageAssets.wind, textColor: Colors.white, backgroundColor: Colors.white30,)),
        Obx(() => SmallContainer(text: '${controller.day.value.humidity!.toInt()}%', image: ImageAssets.sun, textColor: Colors.white, backgroundColor: Colors.white30,)),
      ],
    );
  }
}