import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/View/Home/Components/small_container.dart';

import '../../../ViewModel/Controller/home_controller.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => SmallContainer(text: '${controller.getCloudOver()}%', image: ImageAssets.heavyRain, textColor: Colors.black)),
        Obx(() => SmallContainer(text: '${controller.getWindSpeed()}km/h', image: ImageAssets.wind, textColor: Colors.black)),
        Obx(() => SmallContainer(text: '${controller.getHumidity()}%', image: ImageAssets.sun, textColor: Colors.black)),
      ],
    );
  }
}